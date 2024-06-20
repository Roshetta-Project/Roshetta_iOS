//
//  CenterListView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 31/03/2024.
//

import SwiftUI

struct CenterListView: View {
    // MARK: - PROPERTIES
    let grids: [GridItem] = [
        .init(.flexible()),
        .init(.flexible())
    ]
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: grids, spacing: 10) {
                ForEach(0..<5){_ in
                    NavigationLink {
                        CenterDetailsView()
                    } label: {
                        MedicalCenterCard(image: Image("clinc"),name: "The Care",rate: 3,minPrice: "400",maxPrice: "600",location: "Mansoura, Dakahlia")
                    }
                }.padding()
            }
            }
        }
        .navigationTitle("Centers")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    CenterListView()
}
