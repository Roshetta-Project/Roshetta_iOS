//
//  HealthProblemToggle.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 02/04/2024.
//

import SwiftUI

struct HealthProblemToggle: ToggleStyle {
    let isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                configuration.label
                    .lineLimit(2)
                    .font(.custom(GFFonts.Segui, size: 16))
                    .minimumScaleFactor(0.5)
                    .foregroundColor(isSelected ? Color.white : Color.gray)
                    .padding(8)
                    .background(isSelected ? Colors.main : Color.gray.opacity(0.05))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isSelected ? Colors.main : Color.gray, lineWidth: 1))
            }
        })
    }
}
