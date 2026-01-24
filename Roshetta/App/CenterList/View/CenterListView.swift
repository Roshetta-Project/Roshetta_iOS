//
//  CenterListView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 31/03/2024.
//

import SwiftUI

struct CenterListView: View {

    @StateObject var viewModel = CenterViewModel(useMockData: true)

    let grids: [GridItem] = [
        .init(.flexible()),
        .init(.flexible())
    ]

    var body: some View {
        switch viewModel.status {
        case .loading:
            ProgressView()

        case .error(let error):
            Text("Error: \(error)")

        case .success:
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: grids, spacing: 16) {
                    ForEach(viewModel.centers) { center in
                        NavigationLink {
                            CenterDetailsView(id: center.id)
                        } label: {
                            MedicalCenterCard(
                                image: center.logo,
                                name: center.name,
                                rate: Int(center.ratingsAverage),
                                minPrice: "\(center.price - 100)",
                                maxPrice: "\(center.price + 100)",
                                location: center.location
                            )
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Centers")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
