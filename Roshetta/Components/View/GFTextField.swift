//
//  GFTextField.swift
//  Hafazny
//
//  Created by Abdalazem Saleh on 2023-10-11.
//

import SwiftUI

struct GFTextField: View {
    // MARK: - PROPERTYS
    @Binding var text: String
    
    var title: String
    var image: Image
    var placeholder: String
    var keyBoardType: UIKeyboardType
    let inputType: InputType

    enum InputType {
        case name
        case email
        case phoneNumber
    }

    var validationPredicate: NSPredicate {
        switch inputType {
        case .name:
            return NSPredicate(format: "SELF MATCHES %@", "^[a-zA-Z\\s]{5,42}$")
        case .email:
            return NSPredicate(format: "SELF MATCHES %@", "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")
        case .phoneNumber:
            return NSPredicate(format: "SELF MATCHES %@", "^(010|011|012|015)\\d{8}$")
        }
    }

    @State private var isValid = true

    // MARK: - View
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            textFieldTitle()
            
            imageTextField()
            
            if !isValid {
                Text("Invalid \(title)")
                    .foregroundColor(.red)
                    .font(.footnote)
            }
        }
        .onChange(of: text) { newValue in
            isValid = validationPredicate.evaluate(with: text)
        }
    }
    
    // MARK: - FUNCTIONS
#warning("color")
    private func textFieldTitle() -> some View {
        HStack {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color.black)
            Spacer()
        }
    }
    
    private func imageTextField() -> some View {
        HStack {
            image
                .padding(.horizontal, 8)
            
            TextField(placeholder, text: $text)
                .keyboardType(keyBoardType)
        }
        .frame(height: 48)
        .background {
            Color.gray.opacity(0.04)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(
                    isValid ? .clear : .red,
                    lineWidth: 0.3
                )
                .foregroundColor(Color.gray.opacity(0.3))
        )
    }
}

struct GFTextField_Previews: PreviewProvider {
    @State static var text = ""
    static var previews: some View {
        GFTextField(text: $text,
                    title: "Phone number",
                    image: Image(systemName: "iphone.gen1"),
                    placeholder: "Enter your phone number",
                    keyBoardType: .numberPad,
                    inputType: .email)
    }
}
