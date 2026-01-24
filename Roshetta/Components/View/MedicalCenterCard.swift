//
//  MedicalCenterCard.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-11-09.
//

import SwiftUI

struct MedicalCenterCard: View {
    // MARK: - PROPERTYS
    let image: String
    let name: String
    let rate: Int
    let minPrice: String
    let maxPrice: String
    let location: String
    
    var cardWidth: CGFloat {
        return (UIScreen.main.bounds.width / 2) - 32
    }
    
    // MARK: - VIEW
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                AsyncImage(url: image.asUrl) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .modifier(RoundedImage(size: Dimensions.avatarSmall))
                            .shadow(color: Colors.primaryLabel.opacity(Dimensions.shadowOpacity), radius: Dimensions.shadowRadius, x: Dimensions.shadowX, y: Dimensions.shadowY)
                    case .failure(let error):
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
                        .font(Typography.caption1)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(Colors.primaryLabel)
                    
                    HStack {
                        ForEach(0..<5) { index in
                            Image(systemName: index < rate ? "star.fill" : "star")
                                .resizable()
                                .foregroundColor(.yellow)
                                .frame(width: Dimensions.iconXSmall, height: Dimensions.iconXSmall)
                        }
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: Spacing.small) {
                InfoRow(symbol: SFSymbols.price, text: minPrice + " L.E" + " ~ " + maxPrice + " L.E")
                InfoRow(symbol: SFSymbols.locationPin, text: location)
            }
            .padding(.vertical, Spacing.small)
        }
        .frame(width: cardWidth - 8, alignment: .leading)
        .padding(.vertical, Spacing.small)
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

struct MedicalCenterCard_Previews: PreviewProvider {
    static var previews: some View {
        MedicalCenterCard(
            image: "s",
            name: "The Care",
            rate: 3,
            minPrice: "400",
            maxPrice: "600",
            location: "Mansoura, Dakahlia"
        )
    }
}
