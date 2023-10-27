//
//  RoshettaAppViewModel.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-27.
//

import Foundation
import Combine

class RoshettaAppViewModel: ObservableObject {
    static let shared = RoshettaAppViewModel()
    private let splashVM = SplashViewModel.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var currentState: Bool = false
    
    private init() {
        setUpSubscribers()
    }
    
    private func setUpSubscribers() {
        splashVM.$currentState.sink { [weak self] currentState in
            self?.currentState = currentState
        }
        .store(in: &cancellables)
    }
}
