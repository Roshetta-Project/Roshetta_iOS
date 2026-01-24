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

extension CenterModel {
    static let mockList: [CenterModel] = [
        CenterModel(
            id: "ce1",
            logo: "https://images.unsplash.com/photo-1576091160550-2173dba999ef?q=80&w=200",
            name: "Roshetta Heart & Vascular Center",
            centerPhotos: [
                "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?q=80&w=800",
                "https://images.unsplash.com/photo-1516549655169-df83a0774514?q=80&w=800"
            ],
            specilization: ["Cardiology", "Vascular Surgery", "Radiology"],
            price: 600,
            location: "Tahrir Square, Cairo",
            isfavourite: true,
            ratingsAverage: 4.8
        ),
        CenterModel(
            id: "ce2",
            logo: "https://images.unsplash.com/photo-1527613426441-4da17471b66d?q=80&w=200",
            name: "Alexandria Skin & Laser Hub",
            centerPhotos: [
                "https://images.unsplash.com/photo-1629909613654-28e377c37b09?q=80&w=800"
            ],
            specilization: ["Dermatology", "Cosmetic Surgery"],
            price: 450,
            location: "Kafr Abdo, Alexandria",
            isfavourite: false,
            ratingsAverage: 4.5
        ),
        CenterModel(
            id: "ce3",
            logo: "https://images.unsplash.com/photo-1538108149393-fdfd81895907?q=80&w=200",
            name: "Giza Orthopedic & Rehab",
            centerPhotos: [
                "https://images.unsplash.com/photo-1551076805-e1869033e561?q=80&w=800"
            ],
            specilization: ["Orthopedics", "Physical Therapy", "Sports Medicine"],
            price: 500,
            location: "Pyramids Gardens, Giza",
            isfavourite: true,
            ratingsAverage: 4.9
        ),
        CenterModel(
            id: "ce4",
            logo: "https://images.unsplash.com/photo-1579154235884-1ad28ec42607?q=80&w=200",
            name: "Heliopolis Eye Specialists",
            centerPhotos: [
                "https://images.unsplash.com/photo-1581594693702-fbdc51b2763b?q=80&w=800"
            ],
            specilization: ["Ophthalmology", "Optometry"],
            price: 400,
            location: "Merghany St, Heliopolis",
            isfavourite: true,
            ratingsAverage: 4.7
        ),
        CenterModel(
            id: "ce5",
            logo: "https://images.unsplash.com/photo-1516549655169-df83a0774514?q=80&w=200",
            name: "Al-Amal Women’s Hospital",
            centerPhotos: [
                "https://images.unsplash.com/photo-1519494083200-d29774641e7d?q=80&w=800"
            ],
            specilization: ["Gynecology", "Obstetrics", "Pediatrics"],
            price: 550,
            location: "Saeed St, Tanta",
            isfavourite: false,
            ratingsAverage: 4.6
        ),
        CenterModel(
            id: "ce6",
            logo: "https://images.unsplash.com/photo-1664447972886-4114765eeef2?q=80&w=200",
            name: "Delta ENT Specialty Center",
            centerPhotos: [],
            specilization: ["ENT", "Audiology"],
            price: 350,
            location: "Kawm Al-Ashraf, Zagazig",
            isfavourite: false,
            ratingsAverage: 4.2
        ),
        CenterModel(
            id: "ce7",
            logo: "https://images.unsplash.com/photo-1504813184591-01572f98c85f?q=80&w=200",
            name: "Benha Urology Institute",
            centerPhotos: [],
            specilization: ["Urology", "Nephrology"],
            price: 450,
            location: "Al-Vilal, Benha",
            isfavourite: false,
            ratingsAverage: 4.4
        ),
        CenterModel(
            id: "ce8",
            logo: "https://images.unsplash.com/photo-1527613426441-4da17471b66d?q=80&w=200",
            name: "Maadi Mental Wellness",
            centerPhotos: [
                "https://images.unsplash.com/photo-1516549655169-df83a0774514?q=80&w=800"
            ],
            specilization: ["Psychiatry", "Psychology", "Neurology"],
            price: 700,
            location: "Road 233, Maadi",
            isfavourite: true,
            ratingsAverage: 5.0
        ),
        CenterModel(
            id: "ce9",
            logo: "https://images.unsplash.com/photo-1559757175-5700dde675bc?q=80&w=200",
            name: "New Cairo Neuro Center",
            centerPhotos: [],
            specilization: ["Neurology", "Neurosurgery"],
            price: 650,
            location: "First Settlement, New Cairo",
            isfavourite: true,
            ratingsAverage: 4.8
        ),
        CenterModel(
            id: "ce10",
            logo: "https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=200",
            name: "Future Kids Medical",
            centerPhotos: [
                "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?q=80&w=800"
            ],
            specilization: ["Pediatrics", "Pediatric Surgery"],
            price: 400,
            location: "Hay Al-Gamaa, Mansoura",
            isfavourite: false,
            ratingsAverage: 4.7
        ),
        CenterModel(
            id: "ce11",
            logo: "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?q=80&w=200",
            name: "Nasr City Diagnostic",
            centerPhotos: ["https://images.unsplash.com/photo-1579154235884-1ad28ec42607?q=80&w=800"],
            specilization: ["Radiology", "Internal Medicine"],
            price: 800,
            location: "Makram Ebeid, Nasr City",
            isfavourite: true,
            ratingsAverage: 4.9
        ),
        CenterModel(
            id: "ce12",
            logo: "https://images.unsplash.com/photo-1580281657527-47c9f8e1c5c0?q=80&w=200",
            name: "Elite Dental Hub",
            centerPhotos: ["https://images.unsplash.com/photo-1629909613654-28e377c37b09?q=80&w=800"],
            specilization: ["Dentistry", "Oral Surgery"],
            price: 350,
            location: "Shobra, Cairo",
            isfavourite: false,
            ratingsAverage: 4.3
        ),
        CenterModel(
            id: "ce13",
            logo: "https://images.unsplash.com/photo-1516549655169-df83a0774514?q=80&w=200",
            name: "Suez Canal Wellness",
            centerPhotos: [],
            specilization: ["General Practice", "Family Medicine"],
            price: 200,
            location: "Ismailia City Center",
            isfavourite: false,
            ratingsAverage: 4.1
        ),
        CenterModel(
            id: "ce14",
            logo: "https://images.unsplash.com/photo-1538108149393-fdfd81895907?q=80&w=200",
            name: "Prime Digestive Center",
            centerPhotos: ["https://images.unsplash.com/photo-1516549655169-df83a0774514?q=80&w=800"],
            specilization: ["Gastroenterology", "Hepatology"],
            price: 550,
            location: "El-Galaa St, Suez",
            isfavourite: true,
            ratingsAverage: 4.6
        ),
        CenterModel(
            id: "ce15",
            logo: "https://images.unsplash.com/photo-1576091160550-2173dba999ef?q=80&w=200",
            name: "Cairo Rehab & Physio",
            centerPhotos: ["https://images.unsplash.com/photo-1551076805-e1869033e561?q=80&w=800"],
            specilization: ["Physical Therapy", "Occupational Therapy"],
            price: 300,
            location: "Dokki, Giza",
            isfavourite: true,
            ratingsAverage: 4.8
        )
    ]
}
