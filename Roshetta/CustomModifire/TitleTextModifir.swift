//
//  TitleTextModifir.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-12-04.
//

import SwiftUI

struct TitleTextModifir: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("text"))
            .font(.custom(GFFonts.popinsSemiBold, size: 18))
    }
}
