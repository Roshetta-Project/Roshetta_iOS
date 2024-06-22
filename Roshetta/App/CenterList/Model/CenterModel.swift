//
//  CenterModel.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 22/06/2024.
//

import Foundation

// MARK: - CenterListModel

struct CenterListModel: Codable {
    let data: [CenterModel]
}

// MARK: - CenterModel

struct CenterModel: Codable, Identifiable {
    let id: String
    let logo: String
    let name: String
    let centerPhotos: [String]
    let specilization: [String]
    let price: Int
    let location: String
    let isfavourite: Bool
    let ratingsAverage: Double
}
