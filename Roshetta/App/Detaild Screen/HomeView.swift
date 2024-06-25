//
//  HomeView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 22/03/2024.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    @StateObject var doctorViewModel = DoctorViewModel()
    @StateObject var clinicViewModel = ClinicViewModel()
    @StateObject var centerViewModel = CenterViewModel()
    
    
    
    struct Category {
        let name: String
        let imageName: String
        let destinationView: AnyView
    }
    
    let categories: [Category] = [
        Category(name: "Doctor", imageName: "specialist", destinationView: AnyView(DoctorListView())),
        Category(name: "Clinic", imageName: "specialist", destinationView: AnyView(ClinicListView())),
        Category(name: "Center", imageName: "specialist", destinationView: AnyView(CenterListView())),
        Category(name: "Specialist", imageName: "specialist", destinationView: AnyView(SpecialistListView()))
    ]
    
    // MARK:- VIEW
    
    var body: some View {
        NavigationView{
            ScrollView (.vertical, showsIndicators: false){
                // MARK: - Slider
                HomeSlider(slides: .constant(["Banner", "Banner","user"]))
                
                // MARK: - Categories
                HStack (spacing: 16) {
                    ForEach(categories, id: \.name) { category in
                        NavigationLink(destination: category.destinationView) {
                            CategoryCard(image: category.imageName, name: category.name)
                        }
                    }
                }
                .padding(.vertical, 16)
                
                // MARK: - Nearest Doctors Section
                HStack () {
                    Text("Nearest Doctors")
                        .bold()
                        .font(.system(size: 20))
                    Spacer()
                    NavigationLink {
                        DoctorListView()
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
                        switch doctorViewModel.status {
                        case .loading:
                            ProgressView()
                                .onAppear {
                                    Task {
                                        await doctorViewModel.getDoctors()
                                    }
                                }
                        case .error(let error):
                            Text("Error while loading page:  \(error)")
                        case .success:
                            ForEach(doctorViewModel.doctors){ doctor in
                                NavigationLink {
                                    DoctorDetailsView(id: doctor.id)
                                } label: {
                                    DoctorCard(image: Image("user"), name: doctor.name, specialization: doctor.specilization, rate: Int(doctor.ratingsAverage), price: String(doctor.price), location: doctor.location)
                                }
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
                        ClinicListView()
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
                            switch clinicViewModel.status {
                            case .loading:
                                ProgressView()
                                    .onAppear {
                                        Task {
                                            await clinicViewModel.getClinic()
                                        }
                                    }
                            case .error(let error):
                                Text("Error while loading page:  \(error)")
                            case .success:
                                ForEach(clinicViewModel.clinics){clinic in
                                    NavigationLink {
                                        ClinicDetailsView(id: clinic.id)
                                    } label: {
                                        ClincCard(image: Image("clinc"), name: clinic.name, rate: Int(clinic.ratingsAverage), price: String(clinic.price), location: clinic.location)
                                    }
                                }
                        }
                    }.padding()
                }
                
                // MARK: - Nearest Centers Section
                HStack () {
                    Text("Nearest Centers")
                        .bold()
                        .font(.system(size: 20))
                    Spacer()
                    NavigationLink {
                        CenterListView()
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
                        switch centerViewModel.status {
                        case .loading:
                            ProgressView()
                                .onAppear {
                                    Task {
                                        await centerViewModel.getCenter()
                                    }
                                }
                        case .error(let error):
                            Text("Error while loading page:  \(error)")
                        case .success:
                            ForEach(centerViewModel.centers){center in
                                NavigationLink {
                                    CenterDetailsView()
                                } label: {
                                    MedicalCenterCard(image: Image("clinc"),name: center.name,rate: 3,minPrice: String(center.price - 100),maxPrice: String(center.price + 100),location: center.location)
                                }
                            }
                        }
                    }
                    .padding()
                }
                .navigationBarItems(
                    leading:
                        NavigationLink(destination: NotificationsView()) {
                            Image(systemName: "bell")
                                .foregroundColor(.primary)
                        },
                    trailing:
                        NavigationLink(destination: SearchBar()) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.primary)
                        }
                )
                .navigationBarTitle("", displayMode: .inline)
            }
        }
    }
}
               

#Preview {
    HomeView()
}
