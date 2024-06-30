//
//  CenterListView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 31/03/2024.
//

import SwiftUI

struct CenterListView: View {
    
    // MARK: - PROPERTIES
    
    @StateObject var viewModel = CenterViewModel()
    
    let grids: [GridItem] = [
        .init(.flexible()),
        .init(.flexible())
    ]
    
    // MARK: - View
    
    var body: some View {
        switch viewModel.status{
        case .loading:
            ProgressView()
                .onAppear {
                    Task {
                        await viewModel.getCenter()
                    }
                }
        case .error(let error):
            Text("Error while loading page:  \(error)")
        case .success:
            NavigationStack {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: grids) {
                        ForEach(viewModel.centers){center in
                            NavigationLink {
                                CenterDetailsView()
                            } label: {
                                MedicalCenterCard(
                                    image: Image("clinc"),
                                    name: center.name,
                                    rate: 3,
                                    minPrice: String(center.price - 100),
                                    maxPrice: String(center.price + 100),
                                    location: center.location
                                )
                            }
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

#Preview {
    CenterListView()
}
