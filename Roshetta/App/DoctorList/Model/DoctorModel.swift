//
//  DoctorModel.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 20/06/2024.
//

import Foundation

// MARK: - DoctorListModel

struct DoctorListModel: Codable {
    let data: [DoctorModel]
}

// MARK: - DoctorModel

struct DoctorModel: Codable, Identifiable {
    let id: String
    let image: String
    let name: String
    let specilization: String
    let price: Int
    let location: String
    let ratingsAverage: Int
}


