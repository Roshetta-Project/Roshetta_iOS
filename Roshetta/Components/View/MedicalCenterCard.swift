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
            HStack{
                Spacer()
                Image(systemName: "bookmark.fill")
                    .foregroundColor(Colors.main)
            }
            
            HStack(alignment: .center) {
                Image("clinc")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 64, height: 64)
                    .shadow(color: .black.opacity(0.1), radius: 8)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(name)
                        .font(.custom(GFFonts.SeguiSemiBold, size: 14))
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .foregroundColor(Color.black)
                    
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
        .padding(12)
        .background(
              RoundedRectangle(cornerRadius: 8)
                  .foregroundColor(Color.white)
                  .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 2, y: 2)
          )
        .frame(width: 200)

        
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
