//
//  DoctorDetailsModel.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-06-20.
//

import Foundation

struct DoctorDetailsModel: Codable {
    let data: Doctor
}

// MARK: - Doctor

struct Doctor: Codable {
    let id: String
    let image: String
    let name, specilization, bio: String
    let price: Int
    let location: String
    let isfavourite, isOnline: Bool
    let clinic: Clinic
    let center: Center
    let ratingsAverage: Double
    let reviews: [Review]
}

// MARK: - Center
struct Center: Codable {
    let logo: String
    let name: String
    let centerPhotos: [String]
    let specilization: [String]
    let price: Int
    let location: String
    let isfavourite: Bool
    let ratingsAverage: Double
    let id: String
}

// MARK: - Clinic
struct Clinic: Codable {
    let logo: String
    let name: String
    let clinicPhotos: [String]
    let specilization: String
    let price: Int
    let location: String
    let isfavourite: Bool
    let ratingsAverage: Double
    let id: String
}

// MARK: - Review
struct Review: Codable, Identifiable {
    let review: String
    let ratings: Int
    let doctor: String
    let user: User
    let id: String
}

// MARK: - User
struct User: Codable {
    let name, id: String
}
