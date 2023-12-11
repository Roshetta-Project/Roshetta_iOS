//
//  MultipartURLRequestStrategy.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-12-11.
//

import Foundation

struct MultipartURLRequestStrategy: URLRequestConvertible {
    let configuration: MultipartAPIRequestConfiguration
    
    func asURLRequest() throws -> URLRequest {
        /// URL Components
        var components = configuration.components
        components.scheme = "https"
        components.host = "catreloaded.com"
        components.path = configuration.path
        
        /// URL
        guard let url = components.url else { throw SessionDataTaskError.invalidURL }
        /// Request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = configuration.method.method

        /// Headers
        let requestHeaders = configuration.baseHeaders
        requestHeaders.forEach {
            urlRequest.addValue($1, forHTTPHeaderField: $0)
        }
        
        /// Parameters you need to pass with the request
        if let parameters = configuration.parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            } catch {
                throw error
            }
        }
        
        /// Return
        return urlRequest
    }
}
