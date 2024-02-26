//
//  AuthDataSource.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-20.
//

import Foundation

struct AuthDataSource: AuthDataSourceProtocol {
    var user: UserProtocol?
    var isLoading: Bool = true
}
