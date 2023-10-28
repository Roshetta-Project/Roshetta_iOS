//
//  AuthEndPoint.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-28.
//

import Foundation

enum AuthEndPoint{
    case facebook([String: String])
    case google([String: String])
    case apple([String: String])
}

extension AuthEndPoint: EndPoint {
    var path: String {
        switch self {
        case .facebook:
            return "/auth/facebook"
        case .google:
            return "/auth/google"
        case .apple:
            return "/auth/apple"
        }
    }
    
    var method: HTTPMethod {
        .post
    }
    
    var header: [String : String]? {
        return nil
    }
    
    var body: [String : Any]? {
        return nil
    }
}
