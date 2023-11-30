//
//  PriceCard.swift
//  Roshetta
//
//  Created by Sami Ahmed on 30/11/2023.
//

import SwiftUI
struct PriceCard: View {
    // MARK: - PROPERTYS
    let image: String
    let price: String
    var body: some View {
        HStack(spacing: 4){
            Image(image)
            Text(price + " L.E")
            .font(.custom(GFFonts.popinsSemiBold, size: 14))
            .foregroundColor(Color("text").opacity(0.65))
            
            
        }//HStacks
        .padding(10)
        .background(Color.gray.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("main"), lineWidth: 1))
    }
}

struct PriceCard_Previews: PreviewProvider {
    static var previews: some View {
        PriceCard(image: "Price", price: "200")
    }
}
