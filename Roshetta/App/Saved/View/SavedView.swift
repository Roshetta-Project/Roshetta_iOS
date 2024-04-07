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
    
    
    var body: some View {
        NavigationStack{
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
        }.navigationTitle("Saved").navigationBarTitleDisplayMode(.inline)
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
                                DoctorDetailsView()
                            } label: {
                                DoctorCard(image: Image("user"), name: "Dr. Abdalazem Saleh", specialization: "Surgery", rate: 3, price: "400", location: "Mansoura, Dakahlia")
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
                            ClinicDetailsView()
                        } label: {
                            ClincCard(image: Image("clinc"), name: "The Care", rate: 3, price: "400", location: "Mansoura, Dakahlia")
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
                            CenterDetailsView()
                        } label: {
                            MedicalCenterCard(image: Image("clinc"),name: "The Care",rate: 3,minPrice: "400",maxPrice: "600",location: "Mansoura, Dakahlia")
                        }
                    }.padding()
                }
            }
        default:
            Text("Error: Invalid Page")
        }
    }
}


#Preview {
    SavedView()
}

// MARK: - Segment
struct CustomSegmentedControl: View {
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

