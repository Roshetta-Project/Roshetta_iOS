//
//  DoctorListView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 31/03/2024.
//

import SwiftUI

struct DoctorListView: View {
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
                        DoctorDetailsView()
                    } label: {
                        DoctorCard(image: Image("user"), name: "Dr. Abdalazem Saleh", specialization: "Surgery", rate: 3, price: "400", location: "Mansoura, Dakahlia")
                    }
                }.padding()
            }
            }
        }
        .navigationTitle("Doctors")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    DoctorListView()
}
