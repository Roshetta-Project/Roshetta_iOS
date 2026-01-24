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

struct Doctor: Codable, Identifiable {
    let id: String
    let clinicId: String
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

extension DoctorDetailsModel {

    static func mock(id: String) -> DoctorDetailsModel? {
        guard let doctor = Doctor.mockList.first(where: { $0.id == id }) else {
            return nil
        }
        return DoctorDetailsModel(data: doctor)
    }
}




extension Clinic {

    static let mock1 = Clinic(
        logo: "https://images.unsplash.com/photo-1580281657527-47c9f8e1c5c0",
        name: "Heart Care Clinic",
        clinicPhotos: [],
        specilization: "Cardiology",
        price: 300,
        location: "Nasr City, Cairo",
        isfavourite: true,
        ratingsAverage: 4.7,
        id: "c1"
    )

    static let mock2 = Clinic(
        logo: "https://images.unsplash.com/photo-1580281657527-47c9f8e1c5c0",
        name: "Skin Beauty Clinic",
        clinicPhotos: [],
        specilization: "Dermatology",
        price: 250,
        location: "Smouha, Alexandria",
        isfavourite: false,
        ratingsAverage: 4.3,
        id: "c2"
    )

    static let mock3 = Clinic(
        logo: "https://images.unsplash.com/photo-1576765607924-3f7b8410b57c",
        name: "Bone & Joint Clinic",
        clinicPhotos: [],
        specilization: "Orthopedics",
        price: 400,
        location: "Dokki, Giza",
        isfavourite: true,
        ratingsAverage: 4.8,
        id: "c3"
    )

    static let mock4 = Clinic(
        logo: "https://images.unsplash.com/photo-1580281657527-47c9f8e1c5c0",
        name: "Kids Care Clinic",
        clinicPhotos: [],
        specilization: "Pediatrics",
        price: 280,
        location: "Mansoura",
        isfavourite: false,
        ratingsAverage: 4.6,
        id: "c4"
    )

    static let mock5 = Clinic(
        logo: "https://images.unsplash.com/photo-1576765607924-3f7b8410b57c",
        name: "Brain & Nerves Clinic",
        clinicPhotos: [],
        specilization: "Neurology",
        price: 450,
        location: "New Cairo",
        isfavourite: true,
        ratingsAverage: 4.7,
        id: "c5"
    )

    static let mock6 = Clinic(
        logo: "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d",
        name: "Women Health Clinic",
        clinicPhotos: [],
        specilization: "Gynecology",
        price: 350,
        location: "Tanta",
        isfavourite: false,
        ratingsAverage: 4.4,
        id: "c6"
    )

    static let mock7 = Clinic(
        logo: "https://images.unsplash.com/photo-1606813909027-21fbcf44d4df",
        name: "ENT Care Clinic",
        clinicPhotos: [],
        specilization: "ENT",
        price: 220,
        location: "Zagazig",
        isfavourite: false,
        ratingsAverage: 4.1,
        id: "c7"
    )

    static let mock8 = Clinic(
        logo: "https://images.unsplash.com/photo-1584515933487-779824d29309",
        name: "Vision Eye Clinic",
        clinicPhotos: [],
        specilization: "Ophthalmology",
        price: 320,
        location: "Heliopolis",
        isfavourite: true,
        ratingsAverage: 4.6,
        id: "c8"
    )

    static let mock9 = Clinic(
        logo: "https://images.unsplash.com/photo-1622253692010-333f2da6031d",
        name: "Urology Center",
        clinicPhotos: [],
        specilization: "Urology",
        price: 380,
        location: "Benha",
        isfavourite: false,
        ratingsAverage: 4.3,
        id: "c9"
    )

    static let mock10 = Clinic(
        logo: "https://images.unsplash.com/photo-1607746882042-944635dfe10e",
        name: "Mental Health Clinic",
        clinicPhotos: [],
        specilization: "Psychiatry",
        price: 300,
        location: "Maadi",
        isfavourite: true,
        ratingsAverage: 4.9,
        id: "c10"
    )
}


extension Center {

    static let mock1 = Center(
        logo: "",
        name: "Roshetta Heart Center",
        centerPhotos: [],
        specilization: ["Cardiology"],
        price: 300,
        location: "Cairo",
        isfavourite: true,
        ratingsAverage: 4.6,
        id: "ce1"
    )

    static let mock2 = Center(
        logo: "",
        name: "Skin Care Center",
        centerPhotos: [],
        specilization: ["Dermatology"],
        price: 250,
        location: "Alexandria",
        isfavourite: false,
        ratingsAverage: 4.2,
        id: "ce2"
    )

    static let mock3 = Center(
        logo: "",
        name: "Ortho Medical Center",
        centerPhotos: [],
        specilization: ["Orthopedics"],
        price: 400,
        location: "Giza",
        isfavourite: true,
        ratingsAverage: 4.8,
        id: "ce3"
    )

    static let mock4 = Center(
        logo: "",
        name: "Children Care Center",
        centerPhotos: [],
        specilization: ["Pediatrics"],
        price: 280,
        location: "Mansoura",
        isfavourite: false,
        ratingsAverage: 4.6,
        id: "ce4"
    )

    static let mock5 = Center(
        logo: "",
        name: "Neuro Health Center",
        centerPhotos: [],
        specilization: ["Neurology"],
        price: 450,
        location: "Cairo",
        isfavourite: true,
        ratingsAverage: 4.7,
        id: "ce5"
    )

    static let mock6 = Center(
        logo: "",
        name: "Women Care Center",
        centerPhotos: [],
        specilization: ["Gynecology"],
        price: 350,
        location: "Tanta",
        isfavourite: false,
        ratingsAverage: 4.4,
        id: "ce6"
    )

    static let mock7 = Center(
        logo: "",
        name: "ENT Specialized Center",
        centerPhotos: [],
        specilization: ["ENT"],
        price: 220,
        location: "Zagazig",
        isfavourite: false,
        ratingsAverage: 4.1,
        id: "ce7"
    )

    static let mock8 = Center(
        logo: "",
        name: "Eye Vision Center",
        centerPhotos: [],
        specilization: ["Ophthalmology"],
        price: 320,
        location: "Cairo",
        isfavourite: true,
        ratingsAverage: 4.6,
        id: "ce8"
    )

    static let mock9 = Center(
        logo: "",
        name: "Urology Medical Center",
        centerPhotos: [],
        specilization: ["Urology"],
        price: 380,
        location: "Benha",
        isfavourite: false,
        ratingsAverage: 4.3,
        id: "ce9"
    )

    static let mock10 = Center(
        logo: "",
        name: "Mental Health Center",
        centerPhotos: [],
        specilization: ["Psychiatry"],
        price: 300,
        location: "Cairo",
        isfavourite: true,
        ratingsAverage: 4.9,
        id: "ce10"
    )
}


extension Review {

    static let mockList: [Review] = [
        Review(
            review: "Very professional and polite doctor. Highly recommended.",
            ratings: 5,
            doctor: "1",
            user: User(name: "Mohamed Ali", id: "u1"),
            id: "r1"
        ),
        Review(
            review: "Explained everything clearly and calmly.",
            ratings: 4,
            doctor: "1",
            user: User(name: "Sara Ahmed", id: "u2"),
            id: "r2"
        ),
        Review(
            review: "Clinic was clean and well organized.",
            ratings: 5,
            doctor: "1",
            user: User(name: "Omar Khaled", id: "u3"),
            id: "r3"
        ),
        Review(
            review: "Wait time was a bit long but worth it.",
            ratings: 4,
            doctor: "1",
            user: User(name: "Mona Adel", id: "u4"),
            id: "r4"
        ),
        Review(
            review: "Very knowledgeable and caring doctor.",
            ratings: 5,
            doctor: "1",
            user: User(name: "Youssef Samir", id: "u5"),
            id: "r5"
        ),
        Review(
            review: "Good experience overall.",
            ratings: 4,
            doctor: "1",
            user: User(name: "Nourhan Fathy", id: "u6"),
            id: "r6"
        ),
        Review(
            review: "Answered all my questions patiently.",
            ratings: 5,
            doctor: "1",
            user: User(name: "Khaled Mahmoud", id: "u7"),
            id: "r7"
        ),
        Review(
            review: "Professional staff and great service.",
            ratings: 4,
            doctor: "1",
            user: User(name: "Hala Mostafa", id: "u8"),
            id: "r8"
        ),
        Review(
            review: "Would definitely visit again.",
            ratings: 5,
            doctor: "1",
            user: User(name: "Mahmoud Saeed", id: "u9"),
            id: "r9"
        ),
        Review(
            review: "Highly experienced doctor.",
            ratings: 5,
            doctor: "1",
            user: User(name: "Dina Fathy", id: "u10"),
            id: "r10"
        )
    ]
}
