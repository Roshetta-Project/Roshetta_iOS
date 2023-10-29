//
//  AuthRepositories.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-28.
//

import Foundation
 
protocol AuthRepositories {
    func facebookAuth() async throws
    func googleAuth()
    func appleAuth()
}
