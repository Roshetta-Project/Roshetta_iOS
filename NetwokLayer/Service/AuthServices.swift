//
//  AuthServices.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-28.
//

import Foundation

protocol AuthServicable {
    func facebookAuth(token: String) async throws
    func googleAuth() async throws
    func appleAuth() async throws
}

struct AuthServices: AuthServicable, NetworkServicesMultipart {
    func facebookAuth(token: String) async throws {
        let body = ["authToken": token]
        let user = try await request(endPoint: AuthEndPoint.facebook(body), imagesData: nil)
        print(user)
    }
    
    func googleAuth() async throws {
        
    }
    
    func appleAuth() async throws {
        
    }
}
