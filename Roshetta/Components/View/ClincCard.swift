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
            HStack(alignment: .top, spacing: Spacing.small) {
                AsyncImage(url: image.asUrl) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .modifier(RoundedImage(size: Dimensions.avatarSmall))
                            .shadow(color: Colors.primaryLabel.opacity(Dimensions.shadowOpacity), radius: Dimensions.shadowRadius, x: Dimensions.shadowX, y: Dimensions.shadowY)
                    case .failure(_):
                        Image("user")
                            .resizable()
                            .modifier(RoundedImage(size: Dimensions.avatarSmall))
                            .shadow(color: Colors.primaryLabel.opacity(Dimensions.shadowOpacity), radius: Dimensions.shadowRadius, x: Dimensions.shadowX, y: Dimensions.shadowY)
                    @unknown default:
                        Image("user")
                            .resizable()
                            .modifier(RoundedImage(size: Dimensions.avatarSmall))
                            .shadow(color: Colors.primaryLabel.opacity(Dimensions.shadowOpacity), radius: Dimensions.shadowRadius, x: Dimensions.shadowX, y: Dimensions.shadowY)
                    }
                }
                
                VStack(alignment: .leading, spacing: Spacing.xSmall) {
                    
                    Text(name)
                        .font(Typography.subheadline)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .foregroundColor(Colors.primaryLabel)
                    
                    HStack {
                        ForEach(0..<5) { index in
                            Image(systemName: index < rate ? "star.fill" : "star")
                                .resizable()
                                .foregroundColor(.yellow)
                                .frame(width: Dimensions.iconXSmall, height: Dimensions.iconXSmall)
                        }
                    }//: RATING STARS
                    
                    VStack(alignment: .leading, spacing: Spacing.small) {
                        InfoRow(symbol: SFSymbols.price, text: price)
                        InfoRow(symbol: SFSymbols.locationPin, text: location)
                    }
                }
            }
        }
        .frame(width: cardWidth - 8, alignment: .leading)
        .padding(.vertical, Spacing.mediumSmall)
        .background(
            RoundedRectangle(cornerRadius: Dimensions.cornerRadiusSmall)
                .foregroundColor(Colors.surface)
                .shadow(color: Colors.primaryLabel.opacity(Dimensions.shadowOpacity), radius: Dimensions.shadowRadius, x: Dimensions.shadowX, y: Dimensions.shadowY)
                .frame(width: cardWidth + 4, alignment: .leading)
                .overlay {
                    Image(systemName: "bookmark.fill")
                        .resizable()
                        .frame(width: Dimensions.iconXSmall, height: Dimensions.iconSmall)
                        .foregroundColor(Colors.main)
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .topTrailing
                        )
                        .padding(.top, Spacing.xSmall)
                        .padding(.trailing, Spacing.small)
                }
        )
    }
}

struct ClincCard_Previews: PreviewProvider {
    static var previews: some View {
        ClincCard(image: "", name: "The Care", rate: 3, price: "400", location: "Mansoura, Dakahlia")
    }
}
