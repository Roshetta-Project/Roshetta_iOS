//
//  TitleTextModifir.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-01.
//

import SwiftUI

import SwiftUI

struct TitleTextModifir: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.black)
            .font(.custom(GFFonts.SeguiSemiBold, size: 18))
    }
}
