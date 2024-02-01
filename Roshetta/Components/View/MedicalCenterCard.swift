//
//  MedicalCenterCard.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-11-09.
//

import SwiftUI

struct MedicalCenterCard: View {
    // MARK: - PROPERTYS
    let image: Image
    let name: String
    let rate: Int
    let minPrice: String
    let maxPrice: String
    let location: String
    
    // MARK: - VIEW
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image("clinc")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 64, height: 64)
                    .shadow(color: .black.opacity(0.1), radius: 8)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(name)
                        .font(.custom(GFFonts.popinsSemiBold, size: 14))
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .foregroundColor(Colors.text)
                    
                    HStack {
                        ForEach(0..<5) { index in
                            Image(systemName: index < rate ? "star.fill" : "star")
                                .resizable()
                                .foregroundColor(.yellow)
                                .frame(width: 12, height: 12)
                        }
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                InfoRow(symbol: SFSymbols.price, text: minPrice + " L.E" + " ~ " + maxPrice + " L.E")
                InfoRow(symbol: SFSymbols.locationPin, text: location)
            }
            .padding(.top, 16)
        }
        .padding(16)
        .padding(.horizontal, 8)
        .background(Color.gray.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Colors.main, lineWidth: 1)
        )
        .frame(width: 188)
    }
}

struct MedicalCenterCard_Previews: PreviewProvider {
    static var previews: some View {
        MedicalCenterCard(
            image: Image("clinc"),
            name: "The Care",
            rate: 3,
            minPrice: "400",
            maxPrice: "600",
            location: "Mansoura, Dakahlia"
        )
    }
}
