//
//  DoctorCard.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-11-09.
//

import SwiftUI

struct DoctorCard: View {
    // MARK: - PROPERTIES
    let image: Image
    let name: String
    let specialization: String
    let rate: Int
    let price: String
    let location: String
    
    // MARK: - VIEW
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            image
                .resizable()
                .modifier(RoundedImage(size: 64))

            VStack(alignment: .center, spacing: 4) {
                Text(name)
                    .font(.custom(GFFonts.popinsSemiBold, size: 14))
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .foregroundColor(Colors.text)
                
                Text(specialization)
                    .font(.custom(GFFonts.popinsMedium, size: 12))
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                    .foregroundColor(Colors.text.opacity(0.6))
            }//: DOCTOR INFORMATION

            HStack {
                ForEach(0..<5) { index in
                    Image(systemName: index < rate ? "star.fill" : "star")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: 12, height: 12)
                }
            }//: RATING STARS

            // Price and Location
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    InfoRow(symbol: SFSymbols.price, text: price + " L.E")
                    InfoRow(symbol: SFSymbols.locationPin, text: location)
                }
                Spacer()
            }
        }//: PRICE AND LOCATION
        .padding(12)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .frame(width: 154)
    }
}

struct DoctorCard_Previews: PreviewProvider {
    static var previews: some View {
        DoctorCard(image: Image("user"), name: "Abdalazem Saleh", specialization: "Surgery", rate: 3, price: "400", location: "Mansoura, Dakahlia")
    }
}
