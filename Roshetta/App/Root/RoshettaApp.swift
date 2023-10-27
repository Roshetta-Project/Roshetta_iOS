//
//  RoshettaApp.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-20.
//

import SwiftUI

@main
struct RoshettaApp: App {
    // MARK: - PROPERTYS
    /// SDK
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    /// OTHERS
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @AppStorage("isLogin") var isLogin: Bool = false
    @StateObject var viewModel = RoshettaAppViewModel.shared

    // MARK: - INITILIZER

    // MARK: - MAIN
    var body: some Scene {
        WindowGroup {
            if viewModel.currentState == true {
                if isOnboardingViewActive {
                    /// go to onboarind
                } else {
                    if isLogin {
                        /// go to home
                    } else {
                        /// go to auth screen
                    }
                }
            } else {
                SplashView()
            }
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    
}
