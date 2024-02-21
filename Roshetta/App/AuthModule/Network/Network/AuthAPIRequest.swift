//
//  AuthAPIRequest.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-03.
//

import Foundation

enum AuthAPIRequests {
    case facebook(AuthParametersProtocol)
    case google(AuthParametersProtocol)
    case apple(AuthParametersProtocol)
}


extension AuthAPIRequests: APIRequestConfiguration {
    var method: HTTPMethod {
        .post
    }
    
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
    
    var parameters: Parameters? {
        switch self {
        case .facebook(let parameters):
            return ["authToken" : parameters.token]
        case .google(let parameters):
            return ["authToken" : parameters.token]
        case .apple(let parameters):
            return ["authToken" : parameters.token]
        }
    }
    
    var headers: HTTPHeaders? {
        nil
    }
}

protocol AuthParametersProtocol {
    var token: String { get }
}
