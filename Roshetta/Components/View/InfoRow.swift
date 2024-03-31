//
//  InfoRow.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-11-09.
//

import SwiftUI

struct InfoRow: View {
    let symbol: Image
    let text: String

    var body: some View {
        HStack(spacing: 8) {
            symbol
            Text(text)
                .font(.custom(GFFonts.SeguiSemiBold, size: 10))
                .minimumScaleFactor(1)
                .lineLimit(1)
                .foregroundColor(Colors.text.opacity(0.6))
        }
    }
}
