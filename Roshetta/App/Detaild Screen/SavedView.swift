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
    
    let doctors : [DoctorModel] = [
    
        DoctorModel(id: "6681c514d5f54fd64cd1f373", image: "https://roshetta-back.vercel.app/doctors/doctor-0f52d479-26f5-47cb-b0b1-e4a0d9f5c7d3-1719781513252.jpeg", name: "Dr.Sami Ahmed", specilization: "Surgy", price: 200, location: "Damietta", ratingsAverage: 7.5),
        DoctorModel(id: "6681c840679cb8470a9d1819", image: "https://roshetta-back.vercel.app/doctors/doctor-0f52d479-26f5-47cb-b0b1-e4a0d9f5c7d3-1719781513252.jpeg", name: "Dr.Abdo Sami", specilization: "Surgy", price: 300, location: "Mansoura", ratingsAverage: 9)
    ]
    
    
    
    
    var buttonAction: () -> Void

    
    var body: some View {
        NavigationView{
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
                leading:
                    Button {
                        buttonAction()
                    } label: {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(.gray)
                    },
                trailing:
                    NavigationLink(destination: SearchBar()) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                    }
            )
            .navigationBarTitle("", displayMode: .inline)
        }
        
    }
    
    // MARK: - Functions
    @ViewBuilder
    func getPageContent() -> some View {
        switch selectedPage {
            // Doctors
        case 0:
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    LazyVGrid(columns: grids, spacing: 10) {
                        ForEach(0..<5){_ in
                            NavigationLink {
                                DoctorDetailsView(id: "")
                            } label: {
                                DoctorCard(image: (""), name: "Dr. Abdalazem Saleh", specialization: "Surgery", rate: 3, price: "400", location: "Mansoura, Dakahlia")
                            }
                        }
                    }.padding()
                    
                }
            }
            // Clinics
        case 1:
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: grids, spacing: 10) {
                    ForEach(0..<5){_ in
                        NavigationLink {
                            ClinicDetailsView(id: "66748d78e9aeb04ffc589051")
                        } label: {
                            ClincCard(image: "", name: "The Care", rate: 3, price: "400", location: "Mansoura, Dakahlia")
                        }
                    }.padding()
                }
            }
            // Centers
        case 2:
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: grids, spacing: 10) {
                    ForEach(0..<5){_ in
                        NavigationLink {
                            CenterDetailsView(id: "6681c4a2d5f54fd64cd1f370")
                        } label: {
                            MedicalCenterCard(image: "" ,name: "The Care",rate: 3,minPrice: "400",maxPrice: "600",location: "Mansoura, Dakahlia")
                        }
                    }.padding()
                }
            }
        default:
            Text("Error: Invalid Page")
        }
    }
}


// MARK: - Segment
struct CuustomSegmentedControl: View {
    var title: String
    var index: Int
    @Binding var selectedIndex: Int
    
    var body: some View {
        Button(action: {
            self.selectedIndex = self.index
        }) {
            Text(title)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .foregroundColor(index == selectedIndex ? .white : .gray)
                .background(index == selectedIndex ? Colors.main : Color.clear)
                .cornerRadius(8)
        }
    }
}
