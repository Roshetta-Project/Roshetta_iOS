//
//  StatusImageView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 30/11/2023.
//

import SwiftUI

struct StatusImageView: View {
    // MARK: - PROPERTYS
    let image : String
    
    // MARK: - VIEW
    var body: some View {
        ZStack{
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 128, height: 128)
                .clipShape(Ellipse())
                .overlay(
                    Ellipse()
                        .stroke(Colors.main, lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4)

            Circle()
                .foregroundColor(Color.green)
                .frame(width: 15,height: 15)
                .offset(x: 48, y: 48)
        }
    }
}
struct CategoryDetailsImage_Previews: PreviewProvider {
    static var previews: some View {
        StatusImageView(image: "user")
    }
}
