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
    let ratingsAverage: Double
}


extension Doctor {
    static let mockList: [Doctor] = [
        Doctor(
            id: "d1",
            clinicId: "1",
            image: "https://plus.unsplash.com/premium_photo-1661764878654-3d0fc2eefcca?q=80&w=400&h=400&auto=format&fit=crop",
            name: "Dr. Ahmed Mansour",
            specilization: "Consultant Cardiologist",
            bio: "Specialist in Interventional Cardiology and Heart Failure. MD from Cairo University with over 18 years of clinical experience at Kasr Al-Ainy.",
            price: 600,
            location: "Building 14, 90th Street North, New Cairo",
            isfavourite: true,
            isOnline: true,
            clinic: Clinic.mock1,
            center: Center.mock1,
            ratingsAverage: 4.9,
            reviews: Review.mockForDoctor("d1")
        ),
        Doctor(
            id: "d2",
            clinicId: "1",
            image: "https://images.unsplash.com/photo-1551836022-d5d88e9218df?q=80&w=400&h=400&auto=format&fit=crop",
            name: "Dr. Laila Soliman",
            specilization: "Dermatology & Laser",
            bio: "Expert in cosmetic dermatology and laser surgery. Fellow of the Royal College of Physicians. Specialized in anti-aging and skin health.",
            price: 450,
            location: "22 El-Batal Ahmed Abdel Aziz St, Mohandessin, Giza",
            isfavourite: false,
            isOnline: true,
            clinic: Clinic.mock1,
            center: Center.mock1,
            ratingsAverage: 4.8,
            reviews: Review.mockForDoctor("d2")
        ),
        Doctor(
            id: "d3",
            clinicId: "2",
            image: "https://images.unsplash.com/photo-1622253692010-333f2da6031d?q=80&w=400&h=400&auto=format&fit=crop",
            name: "Dr. Mostafa Hegazi",
            specilization: "Orthopedic Surgeon",
            bio: "Consultant Orthopedic Surgeon specializing in joint replacement and sports injuries. Former Head of Department at Ain Shams University.",
            price: 550,
            location: "Green Plaza Medical Center, Smouha, Alexandria",
            isfavourite: true,
            isOnline: false,
            clinic: Clinic.mock2,
            center: Center.mock2,
            ratingsAverage: 4.7,
            reviews: Review.mockForDoctor("d3")
        ),
        Doctor(
            id: "d4",
            clinicId: "2",
            image: "https://images.unsplash.com/photo-1594824476967-48c8b964273f?q=80&w=400&h=400&auto=format&fit=crop",
            name: "Dr. Mariam El-Shamy",
            specilization: "Pediatric Consultant",
            bio: "Dedicated to newborn care and pediatric nutrition. Providing comprehensive healthcare for children from birth to adolescence.",
            price: 350,
            location: "15 Gezira St, Zamalek, Cairo",
            isfavourite: false,
            isOnline: true,
            clinic: Clinic.mock2,
            center: Center.mock2,
            ratingsAverage: 4.9,
            reviews: Review.mockForDoctor("d4")
        ),
        Doctor(
            id: "d5",
            clinicId: "3",
            image: "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?q=80&w=400&h=400&auto=format&fit=crop",
            name: "Dr. Kareem Fouad",
            specilization: "Neurology Specialist",
            bio: "Specialized in stroke management, epilepsy, and multiple sclerosis. Clinical fellow at the European Board of Neurology.",
            price: 700,
            location: "Victory Square, Maadi, Cairo",
            isfavourite: true,
            isOnline: true,
            clinic: Clinic.mock3,
            center: Center.mock3,
            ratingsAverage: 5.0,
            reviews: Review.mockForDoctor("d5"),
        ),Doctor(
            id: "d6", clinicId: "4",
            image: "https://images.unsplash.com/photo-1622253692010-333f2da6031d?q=80&w=400&h=400&auto=format&fit=crop",
            name: "Dr. Khaled Abdelaziz", specilization: "Physical Therapy",
            bio: "Specialist in sports injuries and post-surgical rehabilitation. Certified from the American Board of Physical Therapy.",
            price: 300, location: "Abbas El Akkad, Nasr City",
            isfavourite: false, isOnline: true, clinic: Clinic.mock4, center: Center.mock4, ratingsAverage: 4.8, reviews: Review.mockForDoctor("d6")
        ),
        Doctor(
            id: "d7", clinicId: "5",
            image: "https://images.unsplash.com/photo-1559839734-2b71f1536783?q=80&w=400&h=400&auto=format&fit=crop",
            name: "Dr. Nourhan El-Kholy", specilization: "Dentistry",
            bio: "Consultant of Orthodontics and Cosmetic Dentistry. Member of the Egyptian Dental Association.",
            price: 400, location: "Cleopatra St, Heliopolis",
            isfavourite: true, isOnline: true, clinic: Clinic.mock5, center: Center.mock5, ratingsAverage: 4.9, reviews: Review.mockForDoctor("d7")
        ),
        Doctor(
            id: "d8", clinicId: "6",
            image: "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?q=80&w=400&h=400&auto=format&fit=crop",
            name: "Dr. Sherif Zaki", specilization: "Urology",
            bio: "Consultant Urologist specializing in minimally invasive surgery and kidney health.",
            price: 450, location: "Gameat El Dewal St, Mohandessin",
            isfavourite: false, isOnline: false, clinic: Clinic.mock6, center: Center.mock6, ratingsAverage: 4.6, reviews: Review.mockForDoctor("d8")
        ),
        Doctor(
            id: "d9", clinicId: "7",
            image: "https://images.unsplash.com/photo-1594824476967-48c8b964273f?q=80&w=400&h=400&auto=format&fit=crop",
            name: "Dr. Amira Fawzy", specilization: "Psychiatry",
            bio: "Child and Adolescent Psychiatrist. Specialized in behavioral therapy and mental wellness.",
            price: 550, location: "Degla, Maadi",
            isfavourite: true, isOnline: true, clinic: Clinic.mock7, center: Center.mock7, ratingsAverage: 5.0, reviews: Review.mockForDoctor("d9")
        ),
        Doctor(
            id: "d10", clinicId: "8",
            image: "https://images.unsplash.com/photo-1614608682850-e0d6ed316d47?q=80&w=400&h=400&auto=format&fit=crop",
            name: "Dr. Hany Ramses", specilization: "General Surgery",
            bio: "Senior Consultant Surgeon at Cairo Scan and Al-Salam International Hospital.",
            price: 650, location: "Corniche El-Nil, Maadi",
            isfavourite: false, isOnline: true, clinic: Clinic.mock8, center: Center.mock8, ratingsAverage: 4.7, reviews: Review.mockForDoctor("d10")
        ),
        Doctor(
            id: "d11", clinicId: "9",
            image: "https://images.unsplash.com/photo-1651008376811-b90baee60c1f?q=80&w=400&h=400&auto=format&fit=crop",
            name: "Dr. Fatma El-Sayed", specilization: "Nutritionist",
            bio: "Clinical Nutritionist specialized in weight management and diabetic diets.",
            price: 250, location: "El-Galaa St, Mansoura",
            isfavourite: true, isOnline: false, clinic: Clinic.mock9, center: Center.mock9, ratingsAverage: 4.5, reviews: Review.mockForDoctor("d11")
        ),
        Doctor(
            id: "d12", clinicId: "10",
            image: "https://plus.unsplash.com/premium_photo-1661764878654-3d0fc2eefcca?q=80&w=400&h=400&auto=format&fit=crop",
            name: "Dr. Sameh Nassar", specilization: "ENT Specialist",
            bio: "Expert in sinus surgery and hearing disorders. Former Fellow at the Paris Ear Institute.",
            price: 350, location: "Shebin El-Kom, Menofia",
            isfavourite: false, isOnline: true, clinic: Clinic.mock10, center: Center.mock10, ratingsAverage: 4.8, reviews: Review.mockForDoctor("d12")
        ),
        Doctor(
            id: "d13", clinicId: "1",
            image: "https://images.unsplash.com/photo-1622253692010-333f2da6031d?q=80&w=400&h=400&auto=format&fit=crop",
            name: "Dr. Ibrahim Galal", specilization: "Endocrinology",
            bio: "Diabetes and Glandular specialist with focus on thyroid disorders.",
            price: 400, location: "Triumph Square, Heliopolis",
            isfavourite: true, isOnline: true, clinic: Clinic.mock1, center: Center.mock1, ratingsAverage: 4.9, reviews: Review.mockForDoctor("d13")
        ),
        Doctor(
            id: "d14", clinicId: "2",
            image: "https://images.unsplash.com/photo-1551836022-d5d88e9218df?q=80&w=400&h=400&auto=format&fit=crop",
            name: "Dr. Heba El-Desouky", specilization: "Obstetrics",
            bio: "Consultant of Obstetrics and Gynecology. Expert in high-risk pregnancy management.",
            price: 500, location: "King Faisal St, Giza",
            isfavourite: false, isOnline: true, clinic: Clinic.mock2, center: Center.mock2, ratingsAverage: 4.7, reviews: Review.mockForDoctor("d14")
        ),
        Doctor(
            id: "d15", clinicId: "3",
            image: "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?q=80&w=400&h=400&auto=format&fit=crop",
            name: "Dr. Mahmoud Shaker", specilization: "Internal Medicine",
            bio: "Comprehensive health checkups and chronic disease management.",
            price: 350, location: "El-Shohada St, Zagazig",
            isfavourite: false, isOnline: false, clinic: Clinic.mock3, center: Center.mock3, ratingsAverage: 4.6, reviews: Review.mockForDoctor("d15")
        )
    ]
}

extension Review {
    static func mockForDoctor(_ doctorId: String) -> [Review] {
        let realFeedbacks = [
            "Excellent doctor, very attentive and explained the treatment plan clearly.",
            "The clinic environment is very clean and professional. Highly recommended.",
            "Best cardiologist in the area. He saved my father's life.",
            "Wait time was about 20 minutes, but the consultation was very thorough.",
            "Very patient with children, my daughter wasn't scared at all!",
            "Professional staff and the doctor is a true expert in his field.",
            "Great experience, he is very honest and doesn't request unnecessary tests.",
            "The follow-up care was excellent. I am feeling much better now.",
            "Very knowledgeable and up-to-date with the latest medical research.",
            "Efficient booking process and a very polite doctor."
        ]
        
        let reviewerNames = ["Omar Zaki", "Hoda Amer", "Tarek Ibrahim", "Salma Nour", "Youssef Ali", "Dina Adel", "Khaled Said", "Mona Fathy", "Zainab Hassan", "Amr Gamal"]

        return (0..<realFeedbacks.count).map { index in
            Review(
                review: realFeedbacks[index],
                ratings: Int.random(in: 4...5),
                doctor: doctorId,
                user: User(name: reviewerNames[index], id: "u\(index)"),
                id: "\(doctorId)-r\(index)"
            )
        }
    }
}
