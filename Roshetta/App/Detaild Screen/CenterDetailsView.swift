//
//  CenterDetailsView.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-01.
//

import SwiftUI

struct CenterDetailsView: View {
    // MARK: - PROPERTIES

    // MARK: - VIEW
    var body: some View {
        NavigationStack {
            ScrollView(.vertical,showsIndicators: false) {
                header()
                VStack(alignment: .leading, spacing: 16){
                    ImageScroll()
                    avilableDoctors()
                    specialization()
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
                }//VStack
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

    // MARK: - FUNCTIONS
    private func header() -> some View {
        VStack(spacing: 4) {
            LogoImageView(image: "clinc")
            HStack(spacing: 0){
                Text("Family Care ")
                    .foregroundColor(Colors.text)
                    .font(.custom(GFFonts.popinsSemiBold, size: 20))

                Text("Clinic ")
                    .foregroundColor(Colors.text.opacity(0.6))
                    .font(.custom(GFFonts.popinsMedium, size: 20))
            }//:HStack

            HStack {
                ForEach(0 ..< 5) { index in
                    Image(systemName: index < 4 ? "star.fill" : "star")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width:15,height: 15)
                }
            } //:HStack

        }//:VStack

    }

    private func avilableDoctors() -> some View{
        VStack(alignment: .leading, spacing: 8){
            Text("Doctors")
                .modifier(TitleTextModifir())

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

    private func specialization() -> some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Specializations")
                .modifier(TitleTextModifir())
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 10) {
                    ForEach(0..<4, id: \.self) { _ in
                        SpecializationCard(specializationImage: "Dentist", specialization: "Dentist")
                    }
                }//:Hstack
                .padding(1)

            }//:ScrollView
        }//:Vstack
    }

    private func priceSection() -> some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Price")
                .modifier(TitleTextModifir())

            PriceCard(image: "Price", price: "300")

        }//:VStack
    }

    private func locationSection() -> some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Location")
                .modifier(TitleTextModifir())

            locationCard(image: "Location", location: "Mansoura")

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



struct CenterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CenterDetailsView()
    }
}
