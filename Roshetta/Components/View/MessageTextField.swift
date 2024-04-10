//
//  MessageTextField.swift
//  Roshetta
//
//  Created by Sami Ahmed on 11/04/2024.
//

import SwiftUI

struct MessageTextField: View {
    @State private var text = ""
    
    var body: some View {
        TextField("Thank you for helping us", text: $text)
            .padding()
        .cornerRadius(8)
        .frame(height: 142)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
    }
}


#Preview {
    MessageTextField()
}
