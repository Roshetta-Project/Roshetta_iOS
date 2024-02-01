//
//  LanguageManager.swift
//  Pickup
//
//  Created by Abdalazem Saleh on 2023-10-17.
//

import Foundation
import Combine

class LanguageManager: ObservableObject {
    @Published var currentLanguage: String

    init() {
        self.currentLanguage = UserDefaults.standard.string(forKey: "AppLanguage") ?? "en"
    }

    func changeAppLanguage(to language: String) {
        self.currentLanguage = language

        UserDefaults.standard.set(language, forKey: "AppLanguage")

        objectWillChange.send()
    }
}
