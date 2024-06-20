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
                                specialization: doctor.specilization,
                                rate: Int(doctor.ratingsAverage),
                                price: String(doctor.price),
                                location: doctor.location
                            )
                        }
                    }
                    .padding()
                }
            }
            .task {
                await viewModel.getDoctors()
            }
            .navigationTitle("Doctors")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
}

#Preview {
    DoctorListView()
}


