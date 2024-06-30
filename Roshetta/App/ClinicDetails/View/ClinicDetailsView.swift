//
//  ClinicDetailsView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 30/11/2023.
//

import SwiftUI

struct ClinicDetailsView: View {
    
    // MARK: - PROPERTIES
    
    let id: String
    @StateObject var viewModel = ClinicDetailsViewModel()

    // MARK: - VIEW
    
    var body: some View {
        switch viewModel.status {
        case .loading:
            ProgressView()
                .task {
                    await viewModel.getDoctors(id: id)
                }
        case .error(let error):
            Text("error while loading page: \(error)")
        case .success:
                ScrollView(.vertical,showsIndicators: false){
                    header()
                    VStack(alignment: .leading, spacing: 16){
                        ImageScroll(images: viewModel.clinic?.data.clinicPhotos ?? [])
                        doctorSection()
                        doctorSpecilization()
                        priceSection()
                        locationSection()
                        reviewSection()

                        GFButton(isLoading: .constant(false),
                                 text: "Book Now",
                                 backgroundColor: Colors.main,
                                 foregroundColot: Color.white) {
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
        }

    }
    
    // MARK: - FUNCITIONS

    private func header() -> some View {
        let clinic = viewModel.clinic?.data
        
        return VStack(spacing: 4) {
            LogoImageView(image: clinic?.logo ?? "")
            HStack(spacing: 0){
                Text(clinic?.name ?? "")
                    .foregroundColor(Colors.text)
                    .font(.custom(GFFonts.popinsSemiBold, size: 20))

                Text("Clinic ")
                    .foregroundColor(Colors.text.opacity(0.6))
                    .font(.custom(GFFonts.popinsMedium, size: 20))
            }//:HStack

            HStack {
                ForEach(0 ..< 5) { index in
                    Image(systemName: index < Int(clinic?.ratingsAverage ?? 2) ? "star.fill" : "star")
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
            DoctorCard(image: " Ima",
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
        let clinic = viewModel.clinic?.data
        return VStack(alignment: .leading, spacing: 8) {
            Text("Price")
                .modifier(TitleTextModifir())

            PriceCard(image: "Price", price: String(clinic?.price ?? 100))
        }//:Group
    }

    private func locationSection() -> some View {
        let clinic = viewModel.clinic?.data
        return VStack(alignment: .leading, spacing: 8){
            Text("Location")
                .modifier(TitleTextModifir())

            locationCard(image: "Location",location: clinic?.location ?? "Not found")

        }//:VStack
    }

    private func reviewSection() -> some View {
        let clinic = viewModel.clinic?.data
        return VStack(alignment: .leading, spacing: 8){
            HStack(spacing:20){
                Text("Reviews")
                    .modifier(TitleTextModifir())
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("See All")
                        .multilineTextAlignment(.trailing)
                        .underline(true, color: .gray)
                        .font(.custom(GFFonts.SeguiSemiBold, size: 14))
                        .foregroundColor(Color.gray)
                        
                })
            }

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
        ClinicDetailsView(id: "66748d78e9aeb04ffc589051")
    }
}
