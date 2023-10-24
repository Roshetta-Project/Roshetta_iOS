//
//  View.swift
//  Pickup
//
//  Created by Abdalazem Saleh on 2023-10-12.
//

import SwiftUI

extension View {
    func sfsymbole() -> some View {
        modifier(SFSymbolModifire())
    }
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
