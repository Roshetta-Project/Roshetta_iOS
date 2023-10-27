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
    
    // MARK: - Body
    var body: some View {
        Images.AppLogo
            .offset(y: -64)
            .scaleEffect(isStarted ? 1 : 0.0)
            .onAppear {
                withAnimation(.linear(duration: 2.5)) {
                    isStarted = true
                }
            }
            .ignoresSafeArea()
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
