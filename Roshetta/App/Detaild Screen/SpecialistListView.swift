//
//  SpecialistListView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 31/03/2024.
//

import SwiftUI

struct SpecialistListView: View {
    // MARK: - Properties
    let specialization = ["Surgery","Dentist","Pediatrics","Psychiatry","Surgery","Dentist","Pediatrics","Psychiatry","Surgery","Dentist","Pediatrics","Psychiatry","Surgery","Dentist","Pediatrics","Psychiatry"]
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0..<16){Index in
                    SpecializationCard(specializationImage: "specialist", specialization: specialization[Index])
                        .padding(.horizontal)
                        .padding(.vertical,6)
                        
                }
            }
        }
        .navigationTitle("Specializations")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    SpecialistListView()
}
