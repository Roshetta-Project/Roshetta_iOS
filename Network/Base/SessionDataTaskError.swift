//
//  SessionDataTaskError.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-12-11.
//

import Foundation

enum SessionDataTaskError: Error {
    case failWithError(Error)
    case noData
    case notFound
    case notAuthorized
    case server
    case noInternetConnection
    case unknow
    case invalidURL
}
