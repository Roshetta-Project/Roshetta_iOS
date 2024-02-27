//
//  AuthAPIClient.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-03.
//

import Foundation

protocol AuthAPIClientProtocol {
    func login(with type: LoginType, parameter: AuthParametersProtocol) async throws -> UserNetworkResponse?
}

class AuthAPIClient: AuthAPIClientProtocol {
    
    let client: BaseAPIClientProtocol
    init(client: BaseAPIClientProtocol) {
      self.client = client
    }
    
    func login(with type: LoginType, parameter: AuthParametersProtocol) async throws -> UserNetworkResponse? {
        var request: AuthAPIRequests
        switch type {
        case .facebook:
            request = AuthAPIRequests.facebook(parameter)
        case .google:
            request = AuthAPIRequests.google(parameter)
        case .apple:
            request = AuthAPIRequests.apple(parameter)
        }
        var user: UserNetworkResponse?
        user = try await client.perform(request)
        return user
    }
}
