//
//  DoctorDetailsView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 30/11/2023.
//

import SwiftUI

struct DoctorDetailsView: View {
    // MARK: - PROPERTYS
    
    // MARK: - VIEW
    var body: some View {
        NavigationStack {
            ScrollView {
                header()
                VStack(alignment: .leading, spacing: 16) {
                    aboutDoctorSection()
                    doctorSpecilization()
                    priceSection()
                    clincSection()
                    locationSection()
                    reviewsSection()
                                        
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
    
    // MARK: - FUNCITIONS
    private func header() -> some View {
        VStack(spacing: 4) {
            StatusImageView(image: "user")
            
            Text("Dr. Abdalzem Saleh")
                .foregroundColor(Colors.text)
                .font(.custom(GFFonts.popinsSemiBold, size: 20))
            
            HStack {
                ForEach(0 ..< 5) { index in
                    Image(systemName: index < 3 ? "star.fill" : "star")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width:15,height: 15)
                }
            }
        }
    }
    
    private func aboutDoctorSection() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("About Doctor")
                .modifier(TitleTextModifir())
            
            AboutCardView(aboutText: "Dr. Abdalazem is a highly skilled and compassionate dentist dedicated to providing comprehensive oral care to his patients. With a wealth of knowledge and experience in dentistry, he excels in diagnosing and treating various dental conditions, ranging from routine cleanings to complex procedures. ")
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
    
    private func clincSection() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Clinic")
                .modifier(TitleTextModifir())
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 4) {
                    ForEach(1..<6) { _ in
                        ClincCard(image: Image("Clinic"),
                                  name: "Care",
                                  rate: 3,
                                  price: "300",
                                  location: "Mansoura")
                    }
                }
            }
        }
    }
    
    private func locationSection() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Location")
                .modifier(TitleTextModifir())
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(1..<6) { _ in
                        locationCard(location: "New Damietta, Damietta")
                    }
                }
                .padding(1)
            }
        }
    }
    
    private func reviewsSection() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Reviews")
                .modifier(TitleTextModifir())
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(1..<6) { _ in
                        ReviewCard(userName: "Sami Ahmed", description: "He is agood doctor and he is good good bbbbnbbb", review: "3")
                    }
                }
                .padding(1)
            }
        }
    }
}

struct DoctorDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorDetailsView()
    }
}
