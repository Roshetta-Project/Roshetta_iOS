//
//  GFSecureTextField.swift
//  Hafazny
//
//  Created by Abdalazem Saleh on 2023-10-11.
//

import SwiftUI

struct GFSecureTextField: View {
    // MARK: - PROPERTYS
    @State private var isSecure: Bool = true
    @Binding var text: String
    
    var title: String
    var image: Image
    var placeholder: String
    var keyBoardType: UIKeyboardType
    
    // MARK: - View
    var body: some View {
        VStack(spacing: 8) {
            textFieldTitle()
            
            imageTextField()
        }
    }
    
    // MARK: - FUNCTIONS
    private func textFieldTitle() -> some View {
        HStack {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
            /// For test white
                .foregroundColor(.white)
            Spacer()
        }
    }
    
    private func imageTextField() -> some View {
        HStack {
            image
                .padding(.horizontal, 8)
            
            if !isSecure {
                TextField(placeholder, text: $text)
                    .autocorrectionDisabled()
                    .keyboardType(keyBoardType)
            } else {
                SecureField(placeholder, text: $text)
                    .autocorrectionDisabled()
                    .keyboardType(keyBoardType)
            }
            
            showPasswordButton()
        }
        .frame(height: 48)
        .background {
            Color.gray.opacity(0.04)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 0.3).foregroundColor(Color.gray.opacity(0.3))
        )
    }
    
    private func showPasswordButton() -> some View {
        Button {
            isSecure.toggle()
        } label: {
            isSecure ?
            Image(systemName: "eye.fill")
                .sfsymbole()
            :
            Image(systemName: "eye.slash.fill")
                .sfsymbole()
        }
    }
}

struct GFSecureTextField_Previews: PreviewProvider {
    @State static private var dumyText: String = ""
    static var previews: some View {
        GFSecureTextField(text: $dumyText,
                          title: "Password",
                          image: Image(systemName: "star"),
                          placeholder: "Enter your password",
                          keyBoardType: .default)
    }
}
