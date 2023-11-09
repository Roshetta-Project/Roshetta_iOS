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
        HStack(spacing: 0) {
            symbol
            Text(text)
                .font(.custom(GFFonts.popinsMedium, size: 10))
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .foregroundColor(Colors.text.opacity(0.6))
        }
    }
}
