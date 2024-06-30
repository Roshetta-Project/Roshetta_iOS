//
//  DoctorCard.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-11-09.
//

import SwiftUI

struct DoctorCard: View {
    // MARK: - PROPERTIES
    let image: String
    let name: String
    let specialization: String
    let rate: Int
    let price: String
    let location: String
    
    var cardWidth: CGFloat {
        return UIScreen.main.bounds.width / 2.2
    }
    
    // MARK: - VIEW
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack{
                Spacer()
                Image(systemName: "bookmark.fill")
                    .foregroundColor(Colors.main)
            }
            
            AsyncImage(url: image.asUrl) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .modifier(RoundedImage(size: 64))
                        .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 2, y: 2)
                case .failure(let error):
                    Image("user")
                        .resizable()
                        .modifier(RoundedImage(size: 64))
                        .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 2, y: 2)
                @unknown default:
                    Image("user")
                        .resizable()
                        .modifier(RoundedImage(size: 64))
                        .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 2, y: 2)
                }
            }
            
            VStack(alignment: .center, spacing: 4) {
                Text(name)
                    .font(.custom(GFFonts.SeguiSemiBold, size: 12))
                    .minimumScaleFactor(0.8)
                    .lineLimit(1)
                    .foregroundColor(Color.black)
                
                Text(specialization)
                    .font(.custom(GFFonts.SeguiSemiBold, size: 12))
                    .minimumScaleFactor(0.8)
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
            }//: PRICE AND LOCATION
            
            
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.white)
                .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 2, y: 2)
        )
        .frame(width: cardWidth)
    }
    
}


struct DoctorCard_Previews: PreviewProvider {
    static var previews: some View {
        DoctorCard(image: "", name: "Dr. Abdalazem Saleh", specialization: "Surgery", rate: 3, price: "400", location: "Mansoura, Dakahlia")
    }
}
