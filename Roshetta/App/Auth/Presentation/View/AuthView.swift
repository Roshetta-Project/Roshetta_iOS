//
//  AuthView.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-28.
//

import SwiftUI

struct AuthView: View {
    // MARK: - PROPERTYS
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                headerView()
                authButtons()
                Spacer()
                footer()
            }
        }
        .ignoresSafeArea()
    }
    
    // MARK: - HEADER
    private func headerView() -> some View {
        ZStack {
            Rectangle()
                .fill(.gray.opacity(0.1))
                .frame(height: 416)
                .cornerRadius(112, corners: [.bottomRight, .bottomLeft])
            
            VStack(spacing: 40) {
                Text("Join us now !")
                    .font(.custom(GFFonts.roman, size: 36))
                    .padding(.top, 32)
                
                Images.join
            }
            .padding(.top, 32)
        }
        .ignoresSafeArea()
    }
    
    // MARK: - AUTH BUTTONS
    private func authButtons() -> some View {
        VStack(spacing: 24) {
            GFAuthButton(icon: SFSymbols.google,
                         tilte: "Continue With Google") {
                // Login with google
            }
            
            GFAuthButton(icon: SFSymbols.facebook,
                         tilte: "Continue With Google") {
                // Login with google
            }

            GFAuthButton(icon: SFSymbols.apple,
                         tilte: "Continue With Google") {
                // Login with google
            }
        }
        .padding(.horizontal)
    }
    
    // MARK: - FOOTER
    private func footer() -> some View {
        Text("By logging in you are agreeing to the Teems & Conditioning and Privacy policy")
            .font(.custom(GFFonts.popinsMedium, size: 16))
            .multilineTextAlignment(.center)
            .padding(.horizontal, 32)
            .padding(.bottom, 32)
            .foregroundColor(.gray.opacity(0.7))
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
