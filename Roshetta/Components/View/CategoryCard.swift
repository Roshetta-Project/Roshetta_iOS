//
//  CategoryCard.swift
//  Roshetta
//
//  Created by Sami Ahmed on 06/12/2023.
//

import SwiftUI

struct CategoryCard: View {
    // MARK: - PROPERTYS
    let image: String
    let name: String
    
    // MARK: - VIEW
    var body: some View {
        VStack{
            Image(image)
                .frame(width: 24,height: 32)
            
            Text(name)
                .font(.custom(GFFonts.roman, size: 14))
                .foregroundColor(Colors.text.opacity(0.85))
        }//Vstack
        .padding(10)
        .padding(.horizontal, 3)
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 0)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Colors.main, lineWidth: 1)
        )
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(image: "AppleIcon", name: "Doctors")
    }
}
