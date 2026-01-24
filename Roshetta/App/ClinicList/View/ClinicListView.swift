//
//  ClinicListView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 31/03/2024.
//

import SwiftUI

struct ClinicListView: View {

    @StateObject private var viewModel: ClinicViewModel

    let grids = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    init(viewModel: ClinicViewModel = ClinicViewModel(useMockData: true)) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        content
            .navigationTitle("Clinics")
            .navigationBarTitleDisplayMode(.large)
            .task {
                if case .loading = viewModel.status {
                    await viewModel.getClinic()
                }
            }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.status {
        case .loading:
            ProgressView()

        case .error(let error):
            Text("Error: \(error)")

        case .success:
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: grids, spacing: 12) {
                    ForEach(viewModel.clinics, id: \.id) { clinic in
                        NavigationLink {
                            ClinicDetailsView(id: clinic.id)
                        } label: {
                            ClincCard(
                                image: clinic.logo,
                                name: clinic.name,
                                rate: Int(clinic.ratingsAverage),
                                price: "\(clinic.price)",
                                location: clinic.location
                            )
                        }
                    }
                }
                .padding()
            }
        }
    }
}
