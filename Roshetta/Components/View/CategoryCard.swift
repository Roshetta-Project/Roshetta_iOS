//
//  CategoryCard.swift
//  Roshetta
//
//  Created by Sami Ahmed on 06/12/2023.
//

import SwiftUI

struct CategoryCard: View {
    
    // MARK: - PROPERTIES
    
    let image: String
    let name: String
    let cardWidth = (UIScreen.main.bounds.width / 4) - 48
    let destinationView: AnyView
    
    // MARK: - VIEW
    
    var body: some View {
        NavigationLink(destination: destinationView) {
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24)

                Text(name)
                    .font(.custom(GFFonts.SeguiSemiBold, size: 14))
                    .foregroundColor(Color.gray)
                    .minimumScaleFactor(0.5)
            }
            .frame(width: cardWidth, height: cardWidth + 8)
            .padding(8)
            .padding(.horizontal, 5)
            .background(Color.white)  // Add background to make sure the card is visible
            .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 0)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Colors.main, lineWidth: 1)
            )
        }
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(image: "AppleIcon", name: "Doctors", destinationView: AnyView(Text("Doctors View")))
    }
}
