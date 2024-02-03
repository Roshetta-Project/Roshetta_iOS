//
//  GFAuthButton.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-28.
//

import SwiftUI

struct GFAuthButton: View {
    // MARK: - PROPERTYS
    var icon: Image
    var tilte: String
    var clouser: () -> Void
    
    // MARK: - VIEW
    var body: some View {
        Button {
            clouser()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 32)
                    .fill(.white)

                HStack(spacing: 16) {
                    icon
                        .padding(.leading, 32)
                    Text(tilte)
                        .foregroundColor(Color.black)
                        .font(.custom(GFFonts.popinsMedium, size: 20))
                    
                    Spacer()
                }
            }
        }
        .shadow(color: .black.opacity(0.1), radius: 3)
        .frame(height: 56)
    }
}

struct GFAuthButton_Previews: PreviewProvider {
    static var previews: some View {
        GFAuthButton(icon: SFSymbols.apple, tilte: "Continue With Apple", clouser: {})
    }
}
