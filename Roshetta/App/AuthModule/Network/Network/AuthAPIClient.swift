//
//  AuthAPIClient.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-03.
//

import Foundation

protocol AuthAPIClientProtocol {
    func facebookAuth(parameter: AuthParametersProtocol) async throws -> UserNetworkResponse?
    func googleAuth(parameter: AuthParametersProtocol) async throws -> UserNetworkResponse?
    func appleAuth(parameter: AuthParametersProtocol) async throws -> UserNetworkResponse?
}

class AuthAPIClient: AuthAPIClientProtocol {
    let client: BaseAPIClientProtocol
    init(client: BaseAPIClientProtocol) {
      self.client = client
    }

    func facebookAuth(parameter: AuthParametersProtocol) async throws -> UserNetworkResponse? {
        let request = AuthAPIRequests.facebook(parameter)
        var user: UserNetworkResponse?
        user = try await client.perform(request)
        return user
    }

    func googleAuth(parameter: AuthParametersProtocol) async throws -> UserNetworkResponse? {
        let request = AuthAPIRequests.google(parameter)
        var user: UserNetworkResponse?
        user = try await client.perform(request)
        return user
    }

    func appleAuth(parameter: AuthParametersProtocol) async throws -> UserNetworkResponse? {
        let request = AuthAPIRequests.apple(parameter)
        var user: UserNetworkResponse?
        user = try await client.perform(request)
        return user
    }
}
