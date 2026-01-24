//
//  ClinicModel.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 20/06/2024.
//

import Foundation

// MARK: - ClinicListModel

struct ClinicListModel: Codable {
    let data: [ClinicModel]
}

// MARK: - ClinicModel

struct ClinicModel: Codable, Identifiable {
    let id: String
    let logo: String
    let name: String
    let clinicPhotos: [String]
    let specilization: String
    let price: Int
    let location: String
    let isfavourite: Bool
    let ratingsAverage: Double
}

extension ClinicModel {
    static let mockList: [ClinicModel] = [
        ClinicModel(
            id: "1", logo: "https://images.unsplash.com/photo-1628595351029-c2bf17511435?q=80&w=200",
            name: "Elite Heart Institute",
            clinicPhotos: ["https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?q=80&w=800"],
            specilization: "Cardiology", price: 500, location: "90th St, New Cairo",
            isfavourite: true, ratingsAverage: 4.9
        ),
        ClinicModel(
            id: "2", logo: "https://images.unsplash.com/photo-1624727828489-a1e03b79bba8?q=80&w=200",
            name: "DermaCare Skin Clinic",
            clinicPhotos: ["https://images.unsplash.com/photo-1527613426441-4da17471b66d?q=80&w=800"],
            specilization: "Dermatology", price: 400, location: "Loran, Alexandria",
            isfavourite: false, ratingsAverage: 4.7
        ),
        ClinicModel(
            id: "3", logo: "https://images.unsplash.com/photo-1530497610245-94d3c16cda28?q=80&w=200",
            name: "Techno-Orthopedic Center",
            clinicPhotos: ["https://images.unsplash.com/photo-1538108149393-fdfd81895907?q=80&w=800"],
            specilization: "Orthopedics", price: 450, location: "Mohandessin, Giza",
            isfavourite: true, ratingsAverage: 4.8
        ),
        ClinicModel(
            id: "4", logo: "https://images.unsplash.com/photo-1664447972886-4114765eeef2?q=80&w=200",
            name: "Little Stars Pediatrics",
            clinicPhotos: ["https://images.unsplash.com/photo-1519494083200-d29774641e7d?q=80&w=800"],
            specilization: "Pediatrics", price: 300, location: "Zamalek, Cairo",
            isfavourite: false, ratingsAverage: 4.6
        ),
        ClinicModel(
            id: "5", logo: "https://images.unsplash.com/photo-1579684385127-1ef15d508118?q=80&w=200",
            name: "Bright Vision Eye Center",
            clinicPhotos: ["https://images.unsplash.com/photo-1579154235884-1ad28ec42607?q=80&w=800"],
            specilization: "Ophthalmology", price: 350, location: "Dokki Square, Giza",
            isfavourite: true, ratingsAverage: 4.7
        ),
        ClinicModel(
            id: "6", logo: "https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?q=80&w=200",
            name: "Smile Dental Center",
            clinicPhotos: ["https://images.unsplash.com/photo-1629909613654-28e377c37b09?q=80&w=800"],
            specilization: "Dentistry", price: 300, location: "Heliopolis, Cairo",
            isfavourite: true, ratingsAverage: 4.8
        ),
        ClinicModel(
            id: "7", logo: "https://images.unsplash.com/photo-1516549655169-df83a0774514?q=80&w=200",
            name: "The Therapy Lab",
            clinicPhotos: ["https://images.unsplash.com/photo-1576091160550-2173dba999ef?q=80&w=800"],
            specilization: "Physical Therapy", price: 350, location: "Nasr City, Cairo",
            isfavourite: false, ratingsAverage: 4.7
        ),
        ClinicModel(
            id: "8", logo: "https://images.unsplash.com/photo-1504813184591-01572f98c85f?q=80&w=200",
            name: "Visionary Eye Care",
            clinicPhotos: ["https://images.unsplash.com/photo-1581594693702-fbdc51b2763b?q=80&w=800"],
            specilization: "Ophthalmology", price: 400, location: "Downtown Alexandria",
            isfavourite: true, ratingsAverage: 4.9
        ),
        ClinicModel(
            id: "9", logo: "https://images.unsplash.com/photo-1551288560-1997a61c667d?q=80&w=200",
            name: "Wellness Psychiatry Hub",
            clinicPhotos: ["https://images.unsplash.com/photo-1527613426441-4da17471b66d?q=80&w=800"],
            specilization: "Psychiatry", price: 600, location: "Maadi, Cairo",
            isfavourite: true, ratingsAverage: 5.0
        ),
        ClinicModel(
            id: "10", logo: "https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?q=80&w=200",
            name: "Gastro Health Center",
            clinicPhotos: ["https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?q=80&w=800"],
            specilization: "Gastroenterology", price: 450, location: "Mohandessin, Giza",
            isfavourite: false, ratingsAverage: 4.6
        ),
        ClinicModel(
            id: "11", logo: "https://images.unsplash.com/photo-1530497610245-94d3c16cda28?q=80&w=200",
            name: "Cairo Scan & Lab",
            clinicPhotos: ["https://images.unsplash.com/photo-1579154235884-1ad28ec42607?q=80&w=800"],
            specilization: "Radiology", price: 1000, location: "Dokki, Giza",
            isfavourite: true, ratingsAverage: 4.9
        ),
        ClinicModel(
            id: "12", logo: "https://images.unsplash.com/photo-1628595351029-c2bf17511435?q=80&w=200",
            name: "The Lung Clinic",
            clinicPhotos: [],
            specilization: "Pulmonology", price: 400, location: "New Cairo",
            isfavourite: false, ratingsAverage: 4.4
        ),
        ClinicModel(
            id: "13", logo: "https://images.unsplash.com/photo-1631217816660-ad3535d9d493?q=80&w=200",
            name: "Kidney Care Institute",
            clinicPhotos: [],
            specilization: "Nephrology", price: 500, location: "Mansoura City",
            isfavourite: true, ratingsAverage: 4.7
        ),
        ClinicModel(
            id: "14", logo: "https://images.unsplash.com/photo-1580281657527-47c9f8e1c5c0?q=80&w=200",
            name: "Life Surgery Center",
            clinicPhotos: ["https://images.unsplash.com/photo-1551076805-e1869033e561?q=80&w=800"],
            specilization: "General Surgery", price: 800, location: "Maadi Corniche",
            isfavourite: false, ratingsAverage: 4.8
        ),
        ClinicModel(
            id: "15", logo: "https://images.unsplash.com/photo-1579684385127-1ef15d508118?q=80&w=200",
            name: "Neuro Wellness",
            clinicPhotos: ["https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?q=80&w=800"],
            specilization: "Neurology", price: 550, location: "Zamalek, Cairo",
            isfavourite: true, ratingsAverage: 4.9
        )
    ]
}
