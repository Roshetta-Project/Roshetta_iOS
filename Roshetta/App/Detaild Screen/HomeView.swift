//
//  HomeView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 22/03/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            ScrollView (.vertical, showsIndicators: false){
                HomeSlider(slides: .constant(["Banner", "Banner","user"]))
                
                HStack (spacing: 22) {
                    CategoryCard(image: "specialist", name: "Doctor")
                    CategoryCard(image: "specialist", name: "Clinic")
                    CategoryCard(image: "specialist", name: "Center")
                    CategoryCard(image: "specialist", name: "Specialist")
                }
                .padding()
                
                HStack () {
                    Text("Nearest Doctors")
                        .bold()
                        .font(.system(size: 20))
                    Spacer()
                    Text("See All")
                        .underline()
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 21) {
                        DoctorCard(image: Image("user"), name: "Dr. Abdalazem Saleh", specialization: "Surgery", rate: 3, price: "400", location: "Mansoura, Dakahlia")
                        
                        DoctorCard(image: Image("user"), name: "Dr. Abdalazem Saleh", specialization: "Surgery", rate: 3, price: "400", location: "Mansoura, Dakahlia")
                        
                        DoctorCard(image: Image("user"), name: "Dr. Abdalazem Saleh", specialization: "Surgery", rate: 3, price: "400", location: "Mansoura, Dakahlia")
                    }
                    .padding()
                }
                
                HStack () {
                    Text("Nearest Clinics")
                        .bold()
                        .font(.system(size: 20))
                    Spacer()
                    Text("See All")
                        .underline()
                        .font(.system(size: 16))
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 21) {
                        ClincCard(image: Image("clinc"), name: "The Care", rate: 3, price: "400", location: "Mansoura, Dakahlia")
                        ClincCard(image: Image("clinc"), name: "The Care", rate: 3, price: "400", location: "Mansoura, Dakahlia")
                        ClincCard(image: Image("clinc"), name: "The Care", rate: 3, price: "400", location: "Mansoura, Dakahlia")
                    }
                    .padding(.horizontal)
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
