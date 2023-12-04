//
//  ClinicDetailsView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 30/11/2023.
//

import SwiftUI

struct ClinicDetailsView: View {
    // MARK: - PROPERTIES
    
    // MARK: - VIEW
    var body: some View {
        NavigationStack{
            ScrollView(.vertical,showsIndicators: false){
                header()
                VStack(alignment: .leading, spacing: 16){
                    ImageScroll()
                    doctorSection()
                    doctorSpecilization()
                    priceSection()
                    locationSection()
                    reviewSection()

                    GFButton(isLoading: .constant(false),
                             text: "Book Now",
                             backgroundColor: Colors.main,
                             foregroundColot: Colors.text) {
                        // TODO: - Book
                    }
                             .padding(.top, 24)
                }//:VStack
                .padding()
            }//:ScrollView
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(
                trailing: HStack {
                    Button(action: {
                        // fav button
                    }) {
                        Image(systemName: "bookmark")
                            .frame(width: 24,   height: 24)
                            .foregroundColor(Color("text"))
                    }
                }
            )
        }//:NavigationStack
    }
    
    private func header() -> some View {
        VStack(spacing: 4) {
            LogoImageView(image: "clinc")
            HStack(spacing: 0){
                Text("Family ")
                    .foregroundColor(Colors.text)
                    .font(.custom(GFFonts.popinsSemiBold, size: 20))
                
                Text("Clinic ")
                    .foregroundColor(Colors.text.opacity(0.6))
                    .font(.custom(GFFonts.popinsMedium, size: 20))
            }//:HStack
            
            HStack {
                ForEach(0 ..< 5) { index in
                    Image(systemName: index < 3 ? "star.fill" : "star")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width:15,height: 15)
                }
            } //:HStack
            
        }//:VStack
    }
    
    private func doctorSection() -> some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Doctors")
                .modifier(TitleTextModifir())
            DoctorCard(image: Image("user"),
                       name: "Dr. Sami Ahmed", specialization: "dentist", rate: 4, price: "300", location: "Cairo")
        }
    }
    
    private func doctorSpecilization() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Specialization")
                .modifier(TitleTextModifir())
            
            SpecializationCard(specializationImage: "Dentist", specialization: "Dentist")
        }
    }
    
    private func priceSection() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Price")
                .modifier(TitleTextModifir())
            
            PriceCard(image: "Price", price: "300")
        }//:Group
    }
    
    private func locationSection() -> some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Location")
                .modifier(TitleTextModifir())
            
            locationCard(image: "Location",location: "Mansoura")
            
        }//:VStack
    }
    
    private func reviewSection() -> some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Reviews")
                .modifier(TitleTextModifir())
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(1..<6) { _ in
                        ReviewCard(userName: "Sami Ahmed", description: "He is agood doctor and he is good good bbbbnbbb", review: "3")
                    }
                } //:HStack
                .padding(1)

            } //:ScrollView
        }//:VStack
    }
    
}

struct ClinicDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ClinicDetailsView()
    }
}
