//
//  ReviewTextField.swift
//  Roshetta
//
//  Created by Sami Ahmed on 04/04/2024.
//

import SwiftUI

struct ReviewTextField: View {
    @State private var text = ""
    
    var body: some View {
        TextField("Thank you for helping us", text: $text)
            .padding()
        .cornerRadius(8)
        .frame(height: 142)
        .overlay(
        RoundedRectangle(cornerRadius: 8)
        .inset(by: 0.5)
        .stroke(Color(red: 0.29, green: 0.64, blue: 0.93), lineWidth: 1)
        )
    }
}

#Preview {
    ReviewTextField()
}
