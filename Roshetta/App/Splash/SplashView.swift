//
//  SplashView.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-27.
//

import SwiftUI

struct SplashView: View {
    // MARK: - Variables
    @State private var isStarted: Bool = false
    @State private var showMainAppView: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack{
            Images.AppLogo
                .scaledToFit()
                .scaleEffect(isStarted ? 1.0: 0.5)
                .onAppear {
                    withAnimation(.linear(duration: 1.3)) {
                        isStarted = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            showMainAppView = true
                        }
                    }
                }
        }.fullScreenCover(isPresented: $showMainAppView) {
            OnboardingView()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
