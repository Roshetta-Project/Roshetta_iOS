//
//  DoctorDetailsView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 30/11/2023.
//

import SwiftUI

struct DoctorDetailsView: View {
    
    // MARK: - PROPERTYS
    let id: String
    @StateObject var viewModel = DoctorDetailsViewModel()
    @State private var isSheetPresented = false
    
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
            ScrollView {
                header()
                VStack(alignment: .leading, spacing: 16) {
                    aboutDoctorSection()
                    doctorSpecilization()
                    priceSection()
                    clincSection()
                    locationSection()
                    reviewsSection()
                    
                    GFButton(
                        isLoading: .constant(false),
                        text: "Book Now",
                        backgroundColor: Colors.main,
                        foregroundColot: Color.white
                    ) {
                        isSheetPresented = true
                    }
                    .padding(.top, 24)
                }//:VStack
                .padding()
            }
            //:ScrollView
            .sheet(isPresented: $isSheetPresented) {
                BookingView()
            }
            .presentationDetents([.fraction(0.4)])
            
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(
                trailing: HStack {
                    Button(action: {}) {
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
        let doctor = viewModel.doctor?.data
        
        return VStack(spacing: 4) {
            StatusImageView(image: "user")
            
            Text(doctor?.name ?? "")
                .foregroundColor(Color.black)
                .font(.custom(GFFonts.SeguiSemiBold, size: 20))
            
            HStack {
                ForEach(0 ..< 5) { index in
                    Image(systemName: index < Int(doctor?.ratingsAverage ?? 2) ? "star.fill" : "star")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width:15,height: 15)
                }
            }
        }
    }
    
    private func aboutDoctorSection() -> some View {
        let doctor = viewModel.doctor?.data
        
        return VStack(alignment: .leading, spacing: 8) {
            Text("About Doctor")
                .modifier(TitleTextModifir())
            
            AboutCardView(aboutText: doctor?.bio ?? "Not founded")
        }
    }
    
    private func doctorSpecilization() -> some View {
        return VStack(alignment: .leading, spacing: 8) {
            Text("Specialization")
                .modifier(TitleTextModifir())
            
            SpecializationCard(specializationImage: "Dentist", specialization: "Dentist")
        }
    }
    
    private func priceSection() -> some View {
        let doctor = viewModel.doctor?.data
        
        return VStack(alignment: .leading, spacing: 8) {
            Text("Price")
                .modifier(TitleTextModifir())
            
            PriceCard(image: "Price", price: String(doctor?.price ?? 100))
        }//:Group
    }
    
    private func clincSection() -> some View {
        let doctor = viewModel.doctor?.data
        
        return VStack(alignment: .leading, spacing: 8) {
            Text("Clinic")
                .modifier(TitleTextModifir())
            
            ClincCard(
                image: Image("Clinic"),
                name: doctor?.clinic.name ?? "",
                rate: Int(doctor?.clinic.ratingsAverage ?? 2),
                price: String(doctor?.clinic.price ?? 100) ,
                location: doctor?.clinic.location ?? "Not found"
            )
            .frame(width: (UIScreen.main.bounds.width / 2) + 20)
            
        }
    }
    
    private func locationSection() -> some View {
        let doctor = viewModel.doctor?.data
        
        return VStack(alignment: .leading, spacing: 8) {
            Text("Location")
                .modifier(TitleTextModifir())
            
            locationCard(image: "Location", location: doctor?.location ?? "Not founded")
        }
    }
    
    private func reviewsSection() -> some View {
        let doctor = viewModel.doctor?.data
        
        return VStack(alignment: .leading, spacing: 8) {
            HStack(spacing:20){
                Text("Reviews")
                    .modifier(TitleTextModifir())
                Spacer()
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
                    if let reviews = doctor?.reviews {
                        ForEach(reviews) { review in
                            ReviewCard(
                                userName: review.user.name,
                                description: review.review,
                                review: String(review.ratings)
                            )
                        }
                        .padding(1)
                    }
                }
            }
        }
    }
}

struct DoctorDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorDetailsView(id: "667473a59048a208580610bf")
    }
}
