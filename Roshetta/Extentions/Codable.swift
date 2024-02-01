//
//  Codable.swift
//  Pickup
//
//  Created by Abdalazem Saleh on 2023-10-14.
//

import Foundation

extension Encodable {
    func asDictionary() throws -> [ String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
