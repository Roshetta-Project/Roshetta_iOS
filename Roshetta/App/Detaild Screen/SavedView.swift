//
//  SavedView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 07/04/2024.
//

import SwiftUI

struct SavedView: View {
    
    // MARK: - PROPERTIES
    @State private var selectedPage = 0
    let grids: [GridItem] = [
        .init(.flexible()),
        .init(.flexible())
    ]
    
    let savedDoctors = Doctor.mockList.filter { $0.isfavourite }
    let savedClinics = ClinicModel.mockList.filter { $0.isfavourite }
    let savedCenters = CenterModel.mockList.filter { $0.isfavourite }
    
    var buttonAction: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 0) {
                    CustomSegmentedControl(title: "Doctors", index: 0, selectedIndex: $selectedPage)
                    CustomSegmentedControl(title: "Clinics", index: 1, selectedIndex: $selectedPage)
                    CustomSegmentedControl(title: "Centers", index: 2, selectedIndex: $selectedPage)
                }
                .padding()
                
                getPageContent()
                
                Spacer()
            }
            .navigationBarItems(
                leading: Button { buttonAction() } label: {
                    Image(systemName: "line.horizontal.3")
                        .foregroundColor(.gray)
                },
                trailing: NavigationLink(destination: SearchBar()) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                }
            )
            .navigationBarTitle("Saved", displayMode: .inline)
        }
    }
    
    // MARK: - Functions
    @ViewBuilder
    func getPageContent() -> some View {
        switch selectedPage {
        case 0: // Saved Doctors
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: grids, spacing: 15) {
                    ForEach(savedDoctors) { doctor in
                        NavigationLink(destination: DoctorDetailsView(id: doctor.id)) {
                            DoctorCard(
                                image: doctor.image,
                                name: doctor.name,
                                specialization: doctor.specilization,
                                rate: Int(doctor.ratingsAverage),
                                price: "\(doctor.price)",
                                location: doctor.location
                            )
                        }
                    }
                }
                .padding()
            }
            
        case 1: // Saved Clinics
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: grids, spacing: 15) {
                    ForEach(savedClinics) { clinic in
                        NavigationLink(destination: ClinicDetailsView(id: clinic.id)) {
                            ClincCard(
                                image: clinic.logo,
                                name: clinic.name,
                                rate: Int(clinic.ratingsAverage),
                                price: "\(clinic.price)",
                                location: clinic.location
                            )
                        }
                    }
                }
                .padding()
            }
            
        case 2: // Saved Centers
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: grids, spacing: 15) {
                    ForEach(savedCenters) { center in
                        NavigationLink(destination: CenterDetailsView(id: center.id)) {
                            MedicalCenterCard(
                                image: center.logo,
                                name: center.name,
                                rate: Int(center.ratingsAverage),
                                minPrice: "\(center.price)",
                                maxPrice: "\(center.price + 200)", // Realistic range
                                location: center.location
                            )
                        }
                    }
                }
                .padding()
            }
            
        default:
            Text("No Items Saved")
        }
    }
}
