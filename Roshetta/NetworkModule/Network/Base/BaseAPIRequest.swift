//
//  BaseAPIRequest.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-12-11.
//

import Foundation

enum BaseAPIRequest: APIRequestConfiguration {
    
    // MARK: - HTTPMethod
    internal var method: HTTPMethod {
      switch self {
        default:
          return .get
      }
    }

    // MARK: - Path
    internal var path: String {
      return ""
    }

    // MARK: - Parameters
    internal var parameters: Parameters? {
      return nil
    }

    // MARK: - Headers
    internal var headers: HTTPHeaders? {
      return nil
    }
}
