//
//  ClincCard.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-11-09.
//

import SwiftUI

struct ClincCard: View {
    // MARK: - PROPERTYS
    let image: String
    let name: String
    let rate: Int
    let price: String
    let location: String
    
    var cardWidth: CGFloat {
        return (UIScreen.main.bounds.width / 2) - 40
    }
    
    // MARK: - VIEW
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 8) {
                AsyncImage(url: image.asUrl) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .modifier(RoundedImage(size: 48))
                            .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 2, y: 2)
                    case .failure(_):
                        Image("user")
                            .resizable()
                            .modifier(RoundedImage(size: 48))
                            .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 2, y: 2)
                    @unknown default:
                        Image("user")
                            .resizable()
                            .modifier(RoundedImage(size: 48))
                            .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 2, y: 2)
                    }
                }
                
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
                                .frame(width: 8, height: 8)
                        }
                    }//: RATING STARS
                    
                    VStack(alignment: .leading, spacing: 8) {
                        InfoRow(symbol: SFSymbols.price, text: price)
                        InfoRow(symbol: SFSymbols.locationPin, text: location)
                    }
                }
            }
        }
        .frame(width: cardWidth - 8, alignment: .leading)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.white)
                .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 2, y: 2)
                .frame(width: cardWidth + 4, alignment: .leading)
                .overlay {
                    Image(systemName: "bookmark.fill")
                        .resizable()
                        .frame(width: 8, height: 12)
                        .foregroundColor(Colors.main)
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .topTrailing
                        )
                        .padding(.top, 4)
                        .padding(.trailing, 6)
                }
        )
    }
}

struct ClincCard_Previews: PreviewProvider {
    static var previews: some View {
        ClincCard(image: "", name: "The Care", rate: 3, price: "400", location: "Mansoura, Dakahlia")
    }
}
