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
                VStack(spacing: Spacing.xLarge) {
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

            VStack(spacing: Spacing.xLarge) {
                Spacer()
                Text("Join us now !")
                    .foregroundColor(Color.black)
                    .font(Typography.largeTitle)
                    .padding(.top, Spacing.xLarge)
                
                Images.authphoto
                    .resizable()
                    .frame(width: 240, height: 280)
            }
            .padding(.top, Spacing.xLarge)
        }
        .ignoresSafeArea()
    }
    
    
    // MARK: - AUTH BUTTONS
    
    private func authButtons() -> some View {
        VStack(spacing: Spacing.large) {
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
        .padding(.horizontal, Spacing.medium)
    }
    
    // MARK: - FOOTER
    
    private func footer() -> some View {
        Text("By logging in you are agreeing to the Terms & Conditions and Privacy policy")
            .font(Typography.callout)
            .multilineTextAlignment(.center)
            .padding(.horizontal, Spacing.xLarge)
            .padding(.bottom, Spacing.xLarge)
            .foregroundColor(Colors.tertiaryLabel)
    }
}
