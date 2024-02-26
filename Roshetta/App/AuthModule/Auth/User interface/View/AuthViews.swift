//
//  AuthViews.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-22.
//

import SwiftUI

protocol AuthViewDependenciesProtocol {
  var authViewModel: AuthViewModel { get set }
}

struct AuthViews: View {
    
    @ObservedObject private var authViewModel: AuthViewModel

    init(dependencies: AuthViewDependenciesProtocol) {
      self.authViewModel = dependencies.authViewModel
    }

    var body: some View {
        Button {
            Task {
                AuthModuleFactory.shared.isFacebook = true
                await authViewModel.facebookLogin()
            }
        } label: {
            Text("Facebook login")
        }

        Button {
            Task {
                AuthModuleFactory.shared.isFacebook = false
                await authViewModel.googleLogin()
            }
        } label: {
            Text("Google login")
        }
    }
}

//#Preview {
//    AuthViews()
//}
