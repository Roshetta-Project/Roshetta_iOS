//
//  SpecializationCard.swift
//  Roshetta
//
//  Created by Sami Ahmed on 30/11/2023.
//

import SwiftUI

struct SpecializationCard: View {
    // MARK: - PROPERTYS
    let specializationImage : String
    let specialization: String
    // MARK: - VIEW
    var body: some View {
        HStack(spacing: 4){
            Image(specializationImage)
            Text (specialization)
                .font(.custom(GFFonts.roman, size: 16))
                .foregroundColor(Color("mainBold"))
        }//HStack
        .padding(8)
        .background(Color.gray.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("main"), lineWidth: 1))
    }
}

struct SpecializationCard_Previews: PreviewProvider {
    static var previews: some View {
        SpecializationCard(specializationImage: "Dentist", specialization: "Dentsit")
    }
}
