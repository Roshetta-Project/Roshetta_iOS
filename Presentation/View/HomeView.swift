//
//  HomeView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 06/12/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            ScrollView(.vertical,showsIndicators: false){
                headerViewSction()
                VStack(alignment: .leading, spacing: 16){
                    nearesrDoctorsSection()
                    nearestCentersSections()
                }//VStack
                .padding()
            } //:ScrollView
            
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(
                leading: HStack {
                    Button(action: {
                        // Handle notification button action
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Colors.text)
                    }
                },
                trailing: HStack {
                    Button(action: {
                        // Handle search button action
                    }) {
                        Image(systemName: "bell.fill")
                            .foregroundColor(Colors.text)
                    }
                }
            )
            
        }//:NavigationStack
        
    }
    
    //MARK: - FUNCTIONS
    private func headerViewSction() -> some View {
        VStack(alignment:.center,spacing: 30){
            HomeSlider(slides:.constant(["user", "user", "Logo"]))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 22) {
                    ForEach(1..<5) { _ in
                        CategoryCard(image: "AppleIcon", name: "Doctor")
                    }
                }//:HStack
                .padding(1)
            }
        }
        .padding()
    }
    
    private func nearesrDoctorsSection() -> some View{
        VStack(alignment: .leading, spacing: 8){
            HStack{
                Text(" Nearest Doctors")
                    .foregroundColor(Colors.text)
                    .font(.custom(GFFonts.popinsSemiBold, size: 20))
                Spacer()
                
                Button {
                    //sell all nearest centers
                } label: {
                    Text("See all")
                        .underline()
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(Colors.text.opacity(0.65))
                    
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(1..<6) { _ in
                        DoctorCard(image: Image("user"),
                                   name: "Dr Abdalazem Saleh",
                                   specialization: "Dentist",
                                   rate: 5,
                                   price: "400",
                                   location: "Mansoura")
                    }
                }//:HStack
                .padding(1)
            }//:ScrollView
        }//:Vstack
    }
    
    private func nearestCentersSections() -> some View {
        VStack(alignment: .leading, spacing: 8){
            HStack{
                Text(" Nearest Centers")
                    .foregroundColor(Colors.text)
                    .font(.custom(GFFonts.popinsSemiBold, size: 20))
                Spacer()
                Button {
                    //sell all nearest centers
                } label: {
                    Text("See all")
                        .underline()
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(Colors.text.opacity(0.65))
                    
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(1..<6) { _ in
                        MedicalCenterCard(image: Image("Logo"), name: "The care", rate: 4, minPrice: "200", maxPrice: "400", location: "Damietta")
                    }
                }//:HStack
                .padding(1)
            }//:ScrollView
        }//:Vstack
    }
    
}


#Preview {
    HomeView()
}
