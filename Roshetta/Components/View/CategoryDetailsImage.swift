//
//  CategoryDetailsImage.swift
//  Roshetta
//
//  Created by Sami Ahmed on 30/11/2023.
//

import SwiftUI
struct CategoryDetailsImage: View {
    // MARK: - PROPERTYS
    let image : String
    var body: some View {
        ZStack{
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 160, height: 160)
                .clipShape(Ellipse())
                .overlay(
                    Ellipse()
                        .stroke(Color("main"), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4)
            
            Circle()
                .foregroundColor(Color.green)
                .frame(width: 15,height: 15)
                .offset(x: 55, y: 60)
        }
    }
}
struct CategoryDetailsImage_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailsImage(image: "user")
    }
}
