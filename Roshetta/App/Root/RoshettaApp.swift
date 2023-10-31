//
//  RoshettaApp.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-20.
//

import SwiftUI
import FacebookLogin
import GoogleSignIn

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
                    OnboardingView()
                } else {
                    if isLogin {
                        /// go to home
                    } else {
                        AuthView()
                    }
                }
            } else {
                SplashView()
            }
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
          
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        ApplicationDelegate.shared.application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        
        var handled: Bool

        handled = GIDSignIn.sharedInstance.handle(url)
        if handled {
          return true
        }
        return false
    }
}
