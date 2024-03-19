//
//  AuthDataSourceProtocol.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-03-19.
//

import Foundation

/// Solve this issus for sami ahmed osman mehid

protocol AuthDataSourceProtocol {
    var user: UserProtocol? { get set }
    var isLoading: Bool { get set }
}
