//
//  LocationCard.swift
//  Roshetta
//
//  Created by Sami Ahmed on 30/11/2023.
//

import SwiftUI

struct locationCard: View {
    // MARK: - PROPERTIES
    let image : String
    let location: String
    
    // MARK: - VIEW
    var body: some View {
        HStack(spacing: 5){
            Image(image)
            
            Text(location)
                .font(.custom(GFFonts.popinsSemiBold, size: 15))
                .foregroundColor(Colors.text.opacity(0.6))
        }//HStack
        .padding(8)
        .background(Color.gray.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Colors.main, lineWidth: 1))
    }
}

struct locationCard_Previews: PreviewProvider {
    static var previews: some View {
        locationCard(image: "Location", location: " New Damietta, Damietta")
    }
}
