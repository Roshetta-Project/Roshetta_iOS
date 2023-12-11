//
//  URLRequestStrategy.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-12-11.
//

import Foundation

protocol URLRequestStrategy {
    func asURLRequest() throws -> URLRequest
}

struct URLRequestStrategyFactory {
    static func createStrategy(for configuration: APIRequestConfiguration) throws -> URLRequestConvertible {
        if let multipartConfig = configuration as? MultipartAPIRequestConfiguration {
            return MultipartURLRequestStrategy(configuration: multipartConfig)
        } else {
            return RegularURLRequestStrategy(configuration: configuration)
        }
    }
}
