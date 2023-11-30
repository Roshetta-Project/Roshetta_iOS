//
//  GFBookButoon.swift
//  Roshetta
//
//  Created by Sami Ahmed on 30/11/2023.
//

import SwiftUI

struct GFBookButoon: View {
    // MARK: - PROPERTYS
    var tilte: String
    // MARK: - VIEW
    var body: some View {
        Button(action: {
            // action
            print("Book button tapped!")
        }) {
            Text(tilte)
                .font(.custom(GFFonts.popinsSemiBold, size: 24))
                .padding()
                .frame(width: 353, height: 56)
                .background(Color("bookButtonColor"))
                .foregroundColor(Color("text"))
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 0)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color("main"), lineWidth: 2))
        }
        .padding()
    }
}
struct GFBookButoon_Previews: PreviewProvider {
    static var previews: some View {
        GFBookButoon(tilte: "BookNow")
    }
}
