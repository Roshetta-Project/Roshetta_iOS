//
//  APIRequestConfiguration.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-12-11.
//

import Foundation

protocol APIRequestConfiguration {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
}

extension APIRequestConfiguration {
    var baseHeaders: HTTPHeaders {
        let headers = [
            "Content-Type": "application/json",
            "Accept": "application/json",
        ]
        return headers
    }
    
    var components: URLComponents {
        let components = URLComponents()
        return components
    }
    
    func createURLRequest() throws -> URLRequest {
        let strategy = try URLRequestStrategyFactory.createStrategy(for: self)
        return try strategy.asURLRequest()
    }
}

typealias HTTPHeaders = [String:String]
typealias Parameters = [String: Any]
