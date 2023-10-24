//
//  EndPoint.swift
//  Almursheed
//
//  Created by Abdalazem Saleh on 2023-08-27.
//

import Foundation

protocol EndPoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    var body: [String: Any]? { get }
}

extension EndPoint {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "api.pickupksa.com"
    }
}
