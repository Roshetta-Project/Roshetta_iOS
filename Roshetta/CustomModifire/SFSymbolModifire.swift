//
//  SFSymbolModifire.swift
//  Hafazny
//
//  Created by Abdalazem Saleh on 2023-10-11.
//

import SwiftUI

struct SFSymbolModifire: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.gray.opacity(0.3))
            .padding(.horizontal)
    }    
}
