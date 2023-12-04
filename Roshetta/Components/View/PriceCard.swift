//
//  PriceCard.swift
//  Roshetta
//
//  Created by Sami Ahmed on 30/11/2023.
//

import SwiftUI
struct PriceCard: View {
    // MARK: - PROPERTIES
    let image: String
    let price: String
    
    // MARK: - VIEW
    var body: some View {
        HStack(spacing: 4){
            Image(image)
            
            Text(price + " L.E")
                .font(.custom(GFFonts.popinsSemiBold, size: 15))
                .foregroundColor(Colors.text.opacity(0.65))
        }//HStacks
        .padding(8)
        .background(Color.gray.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Colors.main, lineWidth: 1)
        )
    }
}

struct PriceCard_Previews: PreviewProvider {
    static var previews: some View {
        PriceCard(image: "Price", price: "200")
    }
}
