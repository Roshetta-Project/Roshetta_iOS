//
//  AuthView.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-28.
//

import SwiftUI
import AuthenticationServices

struct AuthView: View {
    let appleSignInHandler = AppleSignInHandler()

    // MARK: - PROPERTYS
    @StateObject var vm = AuthViewModel.shared
    
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
                vm.googleAuth()
            }
            
            GFAuthButton(icon: SFSymbols.facebook,
                         tilte: "Continue With Facebook") {
                vm.facebookAuth()
            }
            
            GFAuthButton(icon: SFSymbols.apple,
                         tilte: "Continue With Apple") {
                let appleIDProvider = ASAuthorizationAppleIDProvider()
                let request = appleIDProvider.createRequest()
                request.requestedScopes = [.fullName, .email]

                let authorizationController = ASAuthorizationController(authorizationRequests: [request])
                authorizationController.delegate = appleSignInHandler
                authorizationController.presentationContextProvider = appleSignInHandler
                authorizationController.performRequests()
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


class AppleSignInHandler: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
         return UIApplication.shared.connectedScenes
             .first { $0.activationState == .foregroundActive }
             .map { $0 as? UIWindowScene }
             .flatMap { $0?.windows.first }!
     }


    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let userToken = appleIDCredential.identityToken?.base64EncodedString() else { return }
            print("Apple Sign In was successful. User's full name is: \(userToken)")
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Apple Sign In failed with error: \(error.localizedDescription)")
    }
}
