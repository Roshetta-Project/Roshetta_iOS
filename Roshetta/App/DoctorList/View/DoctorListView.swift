//
//  DoctorListView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 31/03/2024.
//

import SwiftUI

struct DoctorListView: View {
    
    // MARK: - PROPERTIES
    
    @StateObject var viewModel = DoctorViewModel()
    
    let grids: [GridItem] = [
        .init(.flexible()),
        .init(.flexible())
    ]
    
    // MARK: - VIEW
    
    var body: some View {
        NavigationStack {
            switch viewModel.status {
            case .loading:
                ProgressView()
            case .error(let error):
                Text("Error while loading page:  \(error)")
            case .success:
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: grids, spacing: 10) {
                        ForEach(viewModel.doctors) { doctor in
                            NavigationLink {
                                DoctorDetailsView(id: doctor.id)
                            } label: {
                                DoctorCard(
                                    image: Image("user"),
                                    name: doctor.name,
                                    specialization: "Surgery",
                                    rate: Int(doctor.ratingsAverage),
                                    price: String(doctor.price),
                                    location: doctor.location
                                )
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .task {
            await viewModel.getDoctors()
        }
        .navigationTitle("Doctors")
        .navigationBarTitleDisplayMode(.large)
    }
    
}

#Preview {
    DoctorListView()
}

//import Foundation
//extension String {
//    var asUrl: URL? {
//        guard let encodedString = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
//            return nil
//        }
//        return URL(string: encodedString)
//    }
//}


//                        ForEach(0..<5){_ in
//                            NavigationLink {
//                                DoctorDetailsView()
//                            } label: {
//                                DoctorCard(image: Image("user"), name: "Dr. Abdalazem Saleh", specialization: "Surgery", rate: 3, price: "400", location: "Mansoura, Dakahlia")
//                            }
//                        }.padding()
