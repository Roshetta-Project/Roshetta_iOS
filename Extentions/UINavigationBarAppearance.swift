//
//  UINavigationBarAppearance.swift
//  Pickup
//
//  Created by Abdalazem Saleh on 2023-10-19.
//

import SwiftUI

extension UINavigationBarAppearance {
    func configureHeaderWithMainColor(color: UIColor) {
        self.shadowColor = .clear
        self.backgroundColor = color
        self.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
