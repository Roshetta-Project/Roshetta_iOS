//
//  HomeView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 22/03/2024.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    let CategoryCardName = ["Doctor","Clinic","Center","Specialist"]
    
    var body: some View {
        NavigationStack{
            ScrollView (.vertical, showsIndicators: false){
                // MARK: - Slider
                HomeSlider(slides: .constant(["Banner", "Banner","user"]))
                
                // MARK: - Categories
                HStack (spacing: 22) {
                    ForEach(0..<4){Index in
                        NavigationLink {
                            
                        } label: {
                            CategoryCard(image: "specialist", name: CategoryCardName[Index])
                        }
                        
                    }
                }
                .padding()
                
                // MARK: - Nearest Doctors Section
                HStack () {
                    Text("Nearest Doctors")
                        .bold()
                        .font(.system(size: 20))
                    Spacer()
                        NavigationLink {
                            
                        } label: {
                            Text("See All")
                                .underline()
                                .font(.system(size: 16))
                                .foregroundColor(.secondary)
                        }
                }
                .padding(.horizontal)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 21) {
                        ForEach(0..<5){_ in
                            NavigationLink {
                                DoctorDetailsView()
                            } label: {
                                DoctorCard(image: Image("user"), name: "Dr. Abdalazem Saleh", specialization: "Surgery", rate: 3, price: "400", location: "Mansoura, Dakahlia")
                            }
                        }
                    }
                    .padding()
                }
                
                // MARK: - Nearest Clinics Section
                HStack () {
                    Text("Nearest Clinics")
                        .bold()
                        .font(.system(size: 20))
                    Spacer()
                    NavigationLink {
                        
                    } label: {
                        Text("See All")
                            .underline()
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 21) {
                        ForEach(0..<5){_ in
                            NavigationLink {
                                ClinicDetailsView()
                            } label: {
                                ClincCard(image: Image("clinc"), name: "The Care", rate: 3, price: "400", location: "Mansoura, Dakahlia")
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                // MARK: - Nearest Centers Section
                HStack () {
                    Text("Nearest Centers")
                        .bold()
                        .font(.system(size: 20))
                    Spacer()
                    NavigationLink {} label: {
                        Text("See All")
                            .underline()
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 21) {
                        ForEach(0..<5){_ in
                            NavigationLink {
                                CenterDetailsView()
                            } label: {
                                MedicalCenterCard(image: Image("clinc"),name: "The Care",rate: 3,minPrice: "400",maxPrice: "600",location: "Mansoura, Dakahlia")
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationBarItems(
                leading: Button(action: {
                    // fav button
                }) {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(Color("text"))
                        .fontWeight(.semibold)
                },
                trailing:
                    Button(action: {
                        // fav button
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color("text"))
                            .fontWeight(.semibold)
                    }
            )
            .padding(.vertical)
            
        }
    }
}

#Preview {
    HomeView()
}
