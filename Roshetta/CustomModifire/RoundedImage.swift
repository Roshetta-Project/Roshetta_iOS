//
//  RoundedImage.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-01.
//

import SwiftUI

struct RoundedImage: ViewModifier {
    let size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .clipShape(Circle())
            .frame(width: size, height: size)
            .shadow(color: .black.opacity(0.1), radius: 2, x: 2, y: 4)
    }
}
