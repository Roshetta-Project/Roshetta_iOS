//
//  HTTPMethod.swift
//  Almursheed
//
//  Created by Abdalazem Saleh on 2023-08-27.
//

import Foundation

enum HTTPMethod {
    case get
    case post
    case update
    case delete
    var method: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .update:
            return "PATCH"
        case .delete:
            return "DELETE"
        }
    }
}
