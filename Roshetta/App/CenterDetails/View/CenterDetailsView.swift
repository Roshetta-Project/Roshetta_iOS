//
//  CenterDetailsView.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-01.
//

import SwiftUI

struct CenterDetailsView: View {
    
    // MARK: - PROPERTIES
    
    let id: String
    @StateObject var viewModel = CenterDetailsViewModel()
    @StateObject var doctorViewModel = DoctorViewModel()

    // MARK: - VIEW
    var body: some View {
        switch viewModel.status {
        case .loading:
            ProgressView()
                .task {
                    await viewModel.getCenters(id: id)
                }
        case .error(let error):
            Text("error while loading page: \(error)")
        case .success:
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
                             foregroundColot: Color.white) {
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
        }
    }

    // MARK: - FUNCTIONS
    private func header() -> some View {
        let center = viewModel.center?.data
        return VStack(spacing: 4) {
            LogoImageView(image: "clinc")
            HStack(spacing: 0){
                Text(center?.name ?? "No Center Name")
                    .foregroundColor(Color.black)
                    .font(.custom(GFFonts.SeguiSemiBold, size: 20))

                Text("Clinic ")
                    .foregroundColor(Color.gray)
                    .font(.custom(GFFonts.SeguiSemiBold, size: 20))
            }//:HStack

            HStack {
                ForEach(0 ..< 5) { index in
                    Image(systemName: index < Int(center?.ratingsAverage ?? 0) ? "star.fill" : "star")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width:15,height: 15)
                }
            } //:HStack

        }//:VStack

    }

    private func avilableDoctors() -> some View{
        let doctors = doctorViewModel.doctors
        return VStack(alignment: .leading, spacing: 8){
            Text("Doctors")
                .modifier(TitleTextModifir())

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
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
                        ForEach(doctorViewModel.doctors) { doctor in
                            DoctorCard(
                                image: Image("user"),
                                name: doctor.name, specialization: doctor.specilization,
                                rate: Int(doctor.ratingsAverage),
                                price: String(doctor.price),
                                location: doctor.location
                            )
                        }
                    }
                }//:HStack
                .padding(2)
            }//:ScrollView
        }//:Vstack
    }

    private func specialization() -> some View {
        let center = viewModel.center?.data
        return VStack(alignment: .leading, spacing: 8){
            Text("Specializations")
                .modifier(TitleTextModifir())
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 10) {
                    ForEach(center?.specilization ?? [], id: \.self) { specialize in
                        SpecializationCard(specializationImage: "Dentist", specialization: specialize)
                    }
                }//:Hstack
                .padding(1)

            }//:ScrollView
        }//:Vstack
    }

    private func priceSection() -> some View {
        let center = viewModel.center?.data
        return VStack(alignment: .leading, spacing: 8){
            Text("Price")
                .modifier(TitleTextModifir())

            PriceCard(image: "Price", price: "\(center?.price ?? 0)")

        }//:VStack
    }

    private func locationSection() -> some View {
        let center = viewModel.center?.data
        return VStack(alignment: .leading, spacing: 8){
            Text("Location")
                .modifier(TitleTextModifir())

            locationCard(image: "Location", location: center?.location ?? "No Location")

        }//:VStack
    }
    private func reviewSection() -> some View {
        let center = viewModel.center?.data
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



struct CenterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CenterDetailsView(id: "6681c4a2d5f54fd64cd1f370")
    }
}
