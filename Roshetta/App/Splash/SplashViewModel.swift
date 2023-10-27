//
//  SplashViewModel.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-27.
//

import Foundation

class SplashViewModel: ObservableObject {
    static let shared = SplashViewModel()
    @Published var currentState: Bool = false
    
    private init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.currentState = true
        }
    }
}
