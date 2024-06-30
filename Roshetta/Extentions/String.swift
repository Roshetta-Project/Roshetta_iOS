//
//  String.swift
//  Pickup
//
//  Created by Abdalazem Saleh on 2023-10-17.
//

import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self)
    }
    
    var asUrl: URL? {
        guard let encodedString = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return nil
        }
        return URL(string: encodedString)
    }
    
    
}
