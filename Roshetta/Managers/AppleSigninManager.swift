//
//  AppleSigninManager.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-31.
//

import Foundation
import AuthenticationServices

class AppleSigninManager: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
            
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
            Task {
                do {
                    try await AuthServices().appleAuth(token: userToken)
                    print("Apple Sign In was successful. User's full name is: \(userToken)")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Apple Sign In failed with error: \(error.localizedDescription)")
    }
    
    func signinWithApple() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}
