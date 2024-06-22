//
//  ClinicListView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 31/03/2024.
//

import SwiftUI

struct ClinicListView: View {
    
    // MARK: - PROPERTIES
    
    @StateObject var viewModel = ClinicViewModel()
    
    let grids: [GridItem] = [
        .init(.flexible()),
        .init(.flexible())
    ]
    
    // MARK: - VIEW
    
    var body: some View {
        switch viewModel.status{
        case .loading:
            ProgressView()
                .onAppear {
                    Task {
                        await viewModel.getClinic()
                    }
                }
        case .error(let error):
            Text("Error while loading page:  \(error)")
        case .success:
            NavigationStack {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: grids, spacing: 10) {
                        ForEach(viewModel.clinics){ clinic in
                            NavigationLink {
                                ClinicDetailsView(id: "66748d78e9aeb04ffc589051")
                            } label: {
                                ClincCard(image: Image("clinc"), name: clinic.name, rate: Int(clinic.ratingsAverage), price: String(clinic.price), location: clinic.location)
                            }
                        }.padding()
                }
                }
            }
            .navigationTitle("Clinics")
            .navigationBarTitleDisplayMode(.large)
        
        }
        
    }
}

#Preview {
    ClinicListView()
}
