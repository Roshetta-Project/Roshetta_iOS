//
//  CustomProfileTextField.swift
//  Roshetta
//
//  Created by Sami Ahmed on 02/04/2024.
//

import SwiftUI

struct CustomProfileTextField: View {
    @State private var text = ""
    let placeholder: String
    
    init(placeholder: String = "") {
        self.placeholder = placeholder
    }
    
    var body: some View {
       ZStack {
            TextField(placeholder, text: $text)
               .font(.custom(GFFonts.Segui, size: 18))
                .padding()
                .frame(height: 50)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
           HStack{
               Spacer()
               Image(systemName: "highlighter")
                   .padding()
                   .foregroundColor(Colors.main)
                   .font(.title2)
           }
        }
    }
}

#Preview {
    CustomProfileTextField()
}
