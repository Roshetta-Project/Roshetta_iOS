//
//  AuthView.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-22.
//

import SwiftUI

protocol AuthViewDependenciesProtocol {
  var authViewModel: AuthViewModel { get set }
}

struct AuthView: View {

    // MARK: - PROPERTYS

    @ObservedObject private var authViewModel: AuthViewModel

    init(dependencies: AuthViewDependenciesProtocol) {
      self.authViewModel = dependencies.authViewModel
    }


    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 32) {
                    headerView()
                    authButtons()
                    Spacer()
                    footer()
                }
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $authViewModel.isSuccess) {
                GenderView(selectedGender: .constant("female"))
            }
        }
    }
    
    // MARK: - HEADER
    
     private func headerView() -> some View {
        ZStack {
            CircularGradient()

            VStack(spacing: 32) {
                Spacer()
                Text("Join us now !")
                    .foregroundColor(Color.black)
                    .font(.custom(GFFonts.SeguiBold, size: 36))
                    .padding(.top, 32)
                
                Images.authphoto
                    .resizable()
                    .frame(width: 240,height: 280)
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
                Task {
                     await authViewModel.login()
                }
            }
            
            GFAuthButton(icon: SFSymbols.facebook,
                         tilte: "Continue With Facebook") {
                Task {
                     await authViewModel.facebookLogin()
                }
            }
            
            GFAuthButton(icon: SFSymbols.apple,
                         tilte: "Continue With Apple") {
                
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
