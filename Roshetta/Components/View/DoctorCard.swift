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
        VStack(alignment: .center, spacing: Spacing.mediumSmall) {
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
                        .modifier(RoundedImage(size: Dimensions.avatarMedium))
                        .shadow(color: Colors.primaryLabel.opacity(Dimensions.shadowOpacity), radius: Dimensions.shadowRadius, x: Dimensions.shadowX, y: Dimensions.shadowY)
                case .failure(let error):
                    Image("user")
                        .resizable()
                        .modifier(RoundedImage(size: Dimensions.avatarMedium))
                        .shadow(color: Colors.primaryLabel.opacity(Dimensions.shadowOpacity), radius: Dimensions.shadowRadius, x: Dimensions.shadowX, y: Dimensions.shadowY)
                @unknown default:
                    Image("user")
                        .resizable()
                        .modifier(RoundedImage(size: Dimensions.avatarMedium))
                        .shadow(color: Colors.primaryLabel.opacity(Dimensions.shadowOpacity), radius: Dimensions.shadowRadius, x: Dimensions.shadowX, y: Dimensions.shadowY)
                }
            }
            
            VStack(alignment: .center, spacing: Spacing.xSmall) {
                Text(name)
                    .font(Typography.caption1)
                    .minimumScaleFactor(0.8)
                    .lineLimit(1)
                    .foregroundColor(Colors.primaryLabel)
                
                Text(specialization)
                    .font(Typography.caption1)
                    .minimumScaleFactor(0.8)
                    .lineLimit(1)
                    .foregroundColor(Colors.secondaryLabel)
            }//: DOCTOR INFORMATION
            
            HStack {
                ForEach(0..<5) { index in
                    Image(systemName: index < rate ? "star.fill" : "star")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: Dimensions.iconSmall, height: Dimensions.iconSmall)
                }
            }//: RATING STARS
            
            // Price and Location
            HStack {
                VStack(alignment: .leading, spacing: Spacing.small) {
                    InfoRow(symbol: SFSymbols.price, text: price + " L.E")
                    InfoRow(symbol: SFSymbols.locationPin, text: location)
                }
            }//: PRICE AND LOCATION
            
            
        }
        .padding(Spacing.mediumSmall)
        .background(
            RoundedRectangle(cornerRadius: Dimensions.cornerRadiusSmall)
                .foregroundColor(Colors.surface)
                .shadow(color: Colors.primaryLabel.opacity(Dimensions.shadowOpacity), radius: Dimensions.shadowRadius, x: Dimensions.shadowX, y: Dimensions.shadowY)
        )
        .frame(width: cardWidth)
    }
}



struct DoctorCard_Previews: PreviewProvider {
    static var previews: some View {
        DoctorCard(image: "", name: "Dr. Abdalazem Saleh", specialization: "Surgery", rate: 3, price: "400", location: "Mansoura, Dakahlia")
    }
}
