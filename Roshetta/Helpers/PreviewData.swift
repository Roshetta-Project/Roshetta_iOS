//
//  PreviewData.swift
//  Roshetta
//
//  Created by Senior iOS Engineer on 2026-01-22.
//
// HIPAA-Compliant Simulated Medical Data for Stakeholder Demos

import Foundation
import SwiftUI

// MARK: - Mock Data Provider
class MockDataProvider {
    static let shared = MockDataProvider()
    
    // MARK: - Patient Data (Diverse Population)
    let patientUsers: [UserModel] = [
        UserModel(
            status: "success",
            data: UserDetails(
                token: "mock_token_patient_001",
                user: UserData(
                    name: "Ahmed Hassan",
                    email: "ahmed.hassan@email.com",
                    MedicalHistory: MedicalHistoryResponseModel(
                        gender: 1, // Male
                        dateOfBirth: "1985-05-15",
                        countryId: 1, // Egypt
                        cityId: 101,
                        height: 175,
                        weight: 82,
                        isExerciseAvilable: true,
                        exerciseType: 2, // Running
                        isAnyHealthProblem: true,
                        medicine: ["Metformin 500mg", "Lisinopril 10mg"],
                        isPregnant: false,
                        isSmoker: false
                    ),
                    id: "patient_001"
                )
            )
        ),
        UserModel(
            status: "success",
            data: UserDetails(
                token: "mock_token_patient_002",
                user: UserData(
                    name: "Fatima Al-Mansouri",
                    email: "fatima.almansouri@email.com",
                    MedicalHistory: MedicalHistoryResponseModel(
                        gender: 2, // Female
                        dateOfBirth: "1990-08-22",
                        countryId: 1,
                        cityId: 102,
                        height: 162,
                        weight: 58,
                        isExerciseAvilable: true,
                        exerciseType: 1, // Yoga
                        isAnyHealthProblem: false,
                        medicine: ["Prenatal Vitamins"],
                        isPregnant: true,
                        isSmoker: false
                    ),
                    id: "patient_002"
                )
            )
        ),
        UserModel(
            status: "success",
            data: UserDetails(
                token: "mock_token_patient_003",
                user: UserData(
                    name: "Mohamed Saleh",
                    email: "m.saleh@email.com",
                    MedicalHistory: MedicalHistoryResponseModel(
                        gender: 1,
                        dateOfBirth: "1970-03-10",
                        countryId: 1,
                        cityId: 103,
                        height: 178,
                        weight: 95,
                        isExerciseAvilable: false,
                        exerciseType: nil,
                        isAnyHealthProblem: true,
                        medicine: ["Atorvastatin 20mg", "Amlodipine 5mg", "Metoprolol 50mg"],
                        isPregnant: false,
                        isSmoker: true
                    ),
                    id: "patient_003"
                )
            )
        ),
        UserModel(
            status: "success",
            data: UserDetails(
                token: "mock_token_patient_004",
                user: UserData(
                    name: "Layla Ibrahim",
                    email: "layla.ibrahim@email.com",
                    MedicalHistory: MedicalHistoryResponseModel(
                        gender: 2,
                        dateOfBirth: "1988-12-30",
                        countryId: 1,
                        cityId: 104,
                        height: 168,
                        weight: 65,
                        isExerciseAvilable: true,
                        exerciseType: 3, // Swimming
                        isAnyHealthProblem: true,
                        medicine: ["Levothyroxine 75mcg", "Sertraline 50mg"],
                        isPregnant: false,
                        isSmoker: false
                    ),
                    id: "patient_004"
                )
            )
        )
    ]
    
    // MARK: - Doctor Data
    let doctors: [DoctorModel] = [
        DoctorModel(
            id: "doc_001",
            image: "https://via.placeholder.com/300x300?text=Dr.+Ahmed+Karim",
            name: "Dr. Ahmed Karim",
            specilization: "Cardiology",
            price: 350,
            location: "Cairo, Egypt",
            ratingsAverage: 4.8
        ),
        DoctorModel(
            id: "doc_002",
            image: "https://via.placeholder.com/300x300?text=Dr.+Noor+Al-Din",
            name: "Dr. Noor Al-Din",
            specilization: "Endocrinology",
            price: 300,
            location: "Giza, Egypt",
            ratingsAverage: 4.7
        ),
        DoctorModel(
            id: "doc_003",
            image: "https://via.placeholder.com/300x300?text=Dr.+Hana+Elmasry",
            name: "Dr. Hana Elmasry",
            specilization: "Obstetrics & Gynecology",
            price: 400,
            location: "Alexandria, Egypt",
            ratingsAverage: 4.9
        ),
        DoctorModel(
            id: "doc_004",
            image: "https://via.placeholder.com/300x300?text=Dr.+Karim+Hassan",
            name: "Dr. Karim Hassan",
            specilization: "Surgery",
            price: 450,
            location: "Cairo, Egypt",
            ratingsAverage: 4.6
        ),
        DoctorModel(
            id: "doc_005",
            image: "https://via.placeholder.com/300x300?text=Dr.+Mona+Rashad",
            name: "Dr. Mona Rashad",
            specilization: "Internal Medicine",
            price: 250,
            location: "Mansoura, Egypt",
            ratingsAverage: 4.5
        ),
        DoctorModel(
            id: "doc_006",
            image: "https://via.placeholder.com/300x300?text=Dr.+Rami+Ibrahim",
            name: "Dr. Rami Ibrahim",
            specilization: "Dermatology",
            price: 280,
            location: "Cairo, Egypt",
            ratingsAverage: 4.7
        ),
        DoctorModel(
            id: "doc_007",
            image: "https://via.placeholder.com/300x300?text=Dr.+Salma+Ahmed",
            name: "Dr. Salma Ahmed",
            specilization: "Neurology",
            price: 380,
            location: "Helwan, Egypt",
            ratingsAverage: 4.8
        ),
        DoctorModel(
            id: "doc_008",
            image: "https://via.placeholder.com/300x300?text=Dr.+Tarek+Mansour",
            name: "Dr. Tarek Mansour",
            specilization: "Orthopedics",
            price: 320,
            location: "Dokki, Egypt",
            ratingsAverage: 4.6
        )
    ]
    
    // MARK: - Detailed Doctor Data
    let doctorDetails: [DoctorDetailsModel] = [
        DoctorDetailsModel(
            data: Doctor(
                id: "doc_001",
                image: "https://via.placeholder.com/300x300?text=Dr.+Ahmed+Karim",
                name: "Dr. Ahmed Karim",
                specilization: "Cardiology",
                bio: "Board-certified cardiologist with 18 years of experience in cardiovascular disease management and interventional procedures.",
                price: 350,
                location: "Cairo, Egypt",
                isfavourite: true,
                isOnline: true,
                clinic: Clinic(
                    logo: "https://via.placeholder.com/100x100?text=Heart+Care+Clinic",
                    name: "Heart Care Clinic",
                    clinicPhotos: [
                        "https://via.placeholder.com/500x300?text=Heart+Care+Clinic+Interior"
                    ],
                    specilization: "Cardiology",
                    price: 350,
                    location: "Downtown Cairo",
                    isfavourite: true,
                    ratingsAverage: 4.8,
                    id: "clinic_001"
                ),
                center: Center(
                    logo: "https://via.placeholder.com/100x100?text=Cairo+Medical+Center",
                    name: "Cairo Medical Center",
                    centerPhotos: [
                        "https://via.placeholder.com/500x300?text=Cairo+Medical+Center+1",
                        "https://via.placeholder.com/500x300?text=Cairo+Medical+Center+2"
                    ],
                    specilization: ["Cardiology", "Interventional Radiology", "Emergency Medicine"],
                    price: 350,
                    location: "Nasr City, Cairo",
                    isfavourite: true,
                    ratingsAverage: 4.9,
                    id: "center_001"
                ),
                ratingsAverage: 4.8,
                reviews: [
                    Review(
                        review: "Excellent doctor! Very knowledgeable and compassionate. Helped manage my hypertension effectively.",
                        ratings: 5,
                        doctor: "Dr. Ahmed Karim",
                        user: User(name: "Hassan M.", id: "user_rev_001"),
                        id: "review_001"
                    ),
                    Review(
                        review: "Great experience. Professional staff and thorough examination.",
                        ratings: 5,
                        doctor: "Dr. Ahmed Karim",
                        user: User(name: "Amira S.", id: "user_rev_002"),
                        id: "review_002"
                    ),
                    Review(
                        review: "Very good doctor but clinic was a bit crowded.",
                        ratings: 4,
                        doctor: "Dr. Ahmed Karim",
                        user: User(name: "Mahmoud K.", id: "user_rev_003"),
                        id: "review_003"
                    )
                ]
            )
        )
    ]
    
    // MARK: - Clinic Data
    let clinics: [ClinicModel] = [
        ClinicModel(
            id: "clinic_001",
            logo: "https://via.placeholder.com/100x100?text=Heart+Care",
            name: "Heart Care Clinic",
            clinicPhotos: ["https://via.placeholder.com/500x300?text=Heart+Care+Interior"],
            specilization: "Cardiology",
            price: 350,
            location: "Downtown Cairo",
            isfavourite: true,
            ratingsAverage: 4.8
        ),
        ClinicModel(
            id: "clinic_002",
            logo: "https://via.placeholder.com/100x100?text=Obstetrics+Care",
            name: "Obstetrics & Maternal Care",
            clinicPhotos: ["https://via.placeholder.com/500x300?text=Obstetrics+Clinic"],
            specilization: "Obstetrics & Gynecology",
            price: 400,
            location: "Alexandria, Egypt",
            isfavourite: false,
            ratingsAverage: 4.9
        ),
        ClinicModel(
            id: "clinic_003",
            logo: "https://via.placeholder.com/100x100?text=Skin+Wellness",
            name: "Skin Wellness Dermatology",
            clinicPhotos: ["https://via.placeholder.com/500x300?text=Dermatology+Clinic"],
            specilization: "Dermatology",
            price: 280,
            location: "Maadi, Cairo",
            isfavourite: true,
            ratingsAverage: 4.6
        ),
        ClinicModel(
            id: "clinic_004",
            logo: "https://via.placeholder.com/100x100?text=Ortho+Pro",
            name: "Orthopedic Pro Clinic",
            clinicPhotos: ["https://via.placeholder.com/500x300?text=Orthopedic+Clinic"],
            specilization: "Orthopedics",
            price: 320,
            location: "Zamalek, Cairo",
            isfavourite: false,
            ratingsAverage: 4.7
        ),
        ClinicModel(
            id: "clinic_005",
            logo: "https://via.placeholder.com/100x100?text=Neuro+Center",
            name: "Neuro Care Center",
            clinicPhotos: ["https://via.placeholder.com/500x300?text=Neurology+Clinic"],
            specilization: "Neurology",
            price: 380,
            location: "Helwan, Cairo",
            isfavourite: false,
            ratingsAverage: 4.8
        ),
        ClinicModel(
            id: "clinic_006",
            logo: "https://via.placeholder.com/100x100?text=Internal+Med",
            name: "Internal Medicine Practice",
            clinicPhotos: ["https://via.placeholder.com/500x300?text=Internal+Medicine"],
            specilization: "Internal Medicine",
            price: 250,
            location: "Mansoura, Egypt",
            isfavourite: true,
            ratingsAverage: 4.5
        )
    ]
    
    // MARK: - Medical Centers
    let centers: [CenterModel] = [
        CenterModel(
            id: "center_001",
            logo: "https://via.placeholder.com/100x100?text=Cairo+Medical",
            name: "Cairo Medical Center",
            centerPhotos: [
                "https://via.placeholder.com/500x300?text=Cairo+Medical+1",
                "https://via.placeholder.com/500x300?text=Cairo+Medical+2"
            ],
            specilization: ["Cardiology", "Orthopedics", "Emergency Medicine"],
            price: 350,
            location: "Nasr City, Cairo",
            isfavourite: true,
            ratingsAverage: 4.9
        ),
        CenterModel(
            id: "center_002",
            logo: "https://via.placeholder.com/100x100?text=Alexandria+Hospital",
            name: "Alexandria Medical Hospital",
            centerPhotos: [
                "https://via.placeholder.com/500x300?text=Alexandria+1",
                "https://via.placeholder.com/500x300?text=Alexandria+2"
            ],
            specilization: ["Obstetrics", "Pediatrics", "Internal Medicine"],
            price: 320,
            location: "Sidi Gaber, Alexandria",
            isfavourite: true,
            ratingsAverage: 4.7
        ),
        CenterModel(
            id: "center_003",
            logo: "https://via.placeholder.com/100x100?text=Giza+Health",
            name: "Giza Health Center",
            centerPhotos: [
                "https://via.placeholder.com/500x300?text=Giza+1",
                "https://via.placeholder.com/500x300?text=Giza+2"
            ],
            specilization: ["Surgery", "Anesthesia", "Critical Care"],
            price: 380,
            location: "6th of October City, Giza",
            isfavourite: false,
            ratingsAverage: 4.6
        ),
        CenterModel(
            id: "center_004",
            logo: "https://via.placeholder.com/100x100?text=Mansoura+Specialized",
            name: "Mansoura Specialized Medical Center",
            centerPhotos: [
                "https://via.placeholder.com/500x300?text=Mansoura+1",
                "https://via.placeholder.com/500x300?text=Mansoura+2"
            ],
            specilization: ["Neurology", "Psychiatry", "Rehabilitation"],
            price: 300,
            location: "Mansoura, Dakahlia",
            isfavourite: true,
            ratingsAverage: 4.8
        )
    ]
    
    // MARK: - Vitals & Lab Results (14+ days of historical data)
    let vitalsHistory: [VitalRecord] = generateVitalsHistory()
    let labResults: [LabResult] = generateLabResults()
    let medications: [MedicationLog] = generateMedicationLogs()
    let appointments: [Appointment] = generateAppointments()
}

// MARK: - Supporting Data Models for Medical Records
struct VitalRecord: Codable, Identifiable {
    let id = UUID()
    let date: String // Format: "YYYY-MM-DD"
    let timestamp: String // HH:MM format
    let heartRate: Int // bpm (beats per minute)
    let systolicBP: Int // mmHg
    let diastolicBP: Int // mmHg
    let oxygenSaturation: Double // % SpO2
    let temperature: Double // °C
    let respiratoryRate: Int // breaths per minute
    let notes: String?
    
    enum CodingKeys: String, CodingKey {
        case date, timestamp, heartRate, systolicBP, diastolicBP, oxygenSaturation, temperature, respiratoryRate, notes
    }
}

struct LabResult: Codable, Identifiable {
    let id = UUID()
    let testName: String
    let value: Double
    let unit: String
    let referenceRange: String
    let status: String // "Normal", "Low", "High"
    let collectionDate: String // Format: "YYYY-MM-DD"
    let resultDate: String // Format: "YYYY-MM-DD"
    let labName: String
    let patientId: String
    
    enum CodingKeys: String, CodingKey {
        case testName, value, unit, referenceRange, status, collectionDate, resultDate, labName, patientId
    }
}

struct MedicationLog: Codable, Identifiable {
    let id = UUID()
    let medicationName: String
    let dosage: String
    let frequency: String // "Once daily", "Twice daily", etc.
    let startDate: String // Format: "YYYY-MM-DD"
    let endDate: String? // Format: "YYYY-MM-DD" (optional, ongoing if nil)
    let purpose: String // e.g., "Blood Pressure Control"
    let prescribedBy: String // Doctor's name
    let patientId: String
    let takenToday: Bool
    
    enum CodingKeys: String, CodingKey {
        case medicationName, dosage, frequency, startDate, endDate, purpose, prescribedBy, patientId, takenToday
    }
}

struct Appointment: Codable, Identifiable {
    let id = UUID()
    let doctorName: String
    let specialty: String
    let clinicName: String
    let appointmentDate: String // Format: "YYYY-MM-DD"
    let appointmentTime: String // Format: "HH:MM"
    let status: String // "Scheduled", "Completed", "Cancelled"
    let location: String
    let notes: String?
    let patientId: String
    
    enum CodingKeys: String, CodingKey {
        case doctorName, specialty, clinicName, appointmentDate, appointmentTime, status, location, notes, patientId
    }
}

// MARK: - Data Generation Functions
private func generateVitalsHistory() -> [VitalRecord] {
    var records: [VitalRecord] = []
    let calendar = Calendar.current
    let today = Date()
    
    // Generate 21 days of vitals data
    for dayOffset in 0..<21 {
        let date = calendar.date(byAdding: .day, value: -dayOffset, to: today) ?? today
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: date)
        
        // Generate 2-3 readings per day (realistic pattern)
        let readingsCount = Int.random(in: 2...3)
        for readingIndex in 0..<readingsCount {
            let hour = 7 + (readingIndex * 8) + Int.random(in: -1...1)
            let minute = Int.random(in: 0...59)
            let timeString = String(format: "%02d:%02d", max(0, min(23, hour)), minute)
            
            // Realistic vital variations
            let heartRate = Int.random(in: 60...95) // Normal resting rate
            let systolicBP = Int.random(in: 110...140)
            let diastolicBP = Int.random(in: 70...90)
            let oxygenSat = Double.random(in: 95.0...100.0)
            let temp = Double.random(in: 36.5...37.5)
            let respRate = Int.random(in: 12...20)
            
            let record = VitalRecord(
                date: dateString,
                timestamp: timeString,
                heartRate: heartRate,
                systolicBP: systolicBP,
                diastolicBP: diastolicBP,
                oxygenSaturation: oxygenSat,
                temperature: temp,
                respiratoryRate: respRate,
                notes: nil
            )
            records.append(record)
        }
    }
    
    return records.sorted { $0.date > $1.date }
}

private func generateLabResults() -> [LabResult] {
    let calendar = Calendar.current
    let today = Date()
    var results: [LabResult] = []
    
    // Generate lab results for different dates
    let testDates = [
        (daysAgo: 2, name: "Fasting Blood Glucose"),
        (daysAgo: 2, name: "Hemoglobin A1c"),
        (daysAgo: 5, name: "Total Cholesterol"),
        (daysAgo: 5, name: "LDL Cholesterol"),
        (daysAgo: 5, name: "HDL Cholesterol"),
        (daysAgo: 5, name: "Triglycerides"),
        (daysAgo: 10, name: "Creatinine"),
        (daysAgo: 10, name: "BUN (Blood Urea Nitrogen)"),
        (daysAgo: 15, name: "TSH (Thyroid Stimulating Hormone)"),
        (daysAgo: 15, name: "Free T4"),
        (daysAgo: 20, name: "Complete Blood Count - WBC"),
        (daysAgo: 20, name: "Complete Blood Count - Hemoglobin"),
        (daysAgo: 20, name: "Complete Blood Count - Platelets"),
    ]
    
    for testDate in testDates {
        let date = calendar.date(byAdding: .day, value: -testDate.daysAgo, to: today) ?? today
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: date)
        
        var testData: (value: Double, unit: String, range: String, status: String) = (0, "", "", "Normal")
        
        switch testDate.name {
        case "Fasting Blood Glucose":
            let value = Double.random(in: 95...140)
            testData = (value: value, unit: "mg/dL", range: "70-100", status: value > 125 ? "High" : "Normal")
        case "Hemoglobin A1c":
            let value = Double.random(in: 5.2...7.5)
            testData = (value: value, unit: "%", range: "< 5.7", status: value > 6.5 ? "High" : "Normal")
        case "Total Cholesterol":
            let value = Double.random(in: 150...250)
            testData = (value: value, unit: "mg/dL", range: "< 200", status: value > 200 ? "High" : "Normal")
        case "LDL Cholesterol":
            let value = Double.random(in: 70...160)
            testData = (value: value, unit: "mg/dL", range: "< 100", status: value > 100 ? "High" : "Normal")
        case "HDL Cholesterol":
            let value = Double.random(in: 30...70)
            testData = (value: value, unit: "mg/dL", range: "> 40", status: value < 40 ? "Low" : "Normal")
        case "Triglycerides":
            let value = Double.random(in: 80...200)
            testData = (value: value, unit: "mg/dL", range: "< 150", status: value > 150 ? "High" : "Normal")
        case "Creatinine":
            let value = Double.random(in: 0.7...1.3)
            testData = (value: value, unit: "mg/dL", range: "0.6-1.2", status: value > 1.2 ? "High" : "Normal")
        case "BUN (Blood Urea Nitrogen)":
            let value = Double.random(in: 10...25)
            testData = (value: value, unit: "mg/dL", range: "7-20", status: value > 20 ? "High" : "Normal")
        case "TSH (Thyroid Stimulating Hormone)":
            let value = Double.random(in: 0.4...4.0)
            testData = (value: value, unit: "mIU/L", range: "0.4-4.0", status: "Normal")
        case "Free T4":
            let value = Double.random(in: 0.8...1.8)
            testData = (value: value, unit: "ng/dL", range: "0.8-1.8", status: "Normal")
        case "Complete Blood Count - WBC":
            let value = Double.random(in: 4.5...11.0)
            testData = (value: value, unit: "K/µL", range: "4.5-11.0", status: "Normal")
        case "Complete Blood Count - Hemoglobin":
            let value = Double.random(in: 12.0...17.0)
            testData = (value: value, unit: "g/dL", range: "12.0-16.0", status: value > 16 ? "High" : "Normal")
        case "Complete Blood Count - Platelets":
            let value = Double.random(in: 150...400)
            testData = (value: value, unit: "K/µL", range: "150-400", status: "Normal")
        default:
            testData = (value: 0, unit: "", range: "", status: "Normal")
        }
        
        let result = LabResult(
            testName: testDate.name,
            value: testData.value,
            unit: testData.unit,
            referenceRange: testData.range,
            status: testData.status,
            collectionDate: dateString,
            resultDate: dateString,
            labName: "Roshetta Diagnostic Lab",
            patientId: "patient_001"
        )
        results.append(result)
    }
    
    return results.sorted { $0.resultDate > $1.resultDate }
}

private func generateMedicationLogs() -> [MedicationLog] {
    let medications: [(name: String, dosage: String, frequency: String, purpose: String)] = [
        ("Metformin", "500 mg", "Twice daily", "Diabetes Management"),
        ("Lisinopril", "10 mg", "Once daily", "Blood Pressure Control"),
        ("Atorvastatin", "20 mg", "Once daily at night", "Cholesterol Management"),
        ("Aspirin", "81 mg", "Once daily", "Cardiovascular Protection"),
        ("Vitamin D3", "2000 IU", "Once daily", "Bone Health"),
        ("Omega-3 Supplement", "1000 mg", "Once daily", "Heart Health")
    ]
    
    let calendar = Calendar.current
    let today = Date()
    var logs: [MedicationLog] = []
    
    for (index, med) in medications.enumerated() {
        let startDate = calendar.date(byAdding: .day, value: -(30 + index * 5), to: today) ?? today
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let startDateString = formatter.string(from: startDate)
        
        let log = MedicationLog(
            medicationName: med.name,
            dosage: med.dosage,
            frequency: med.frequency,
            startDate: startDateString,
            endDate: nil, // Ongoing
            purpose: med.purpose,
            prescribedBy: "Dr. Ahmed Karim",
            patientId: "patient_001",
            takenToday: Bool.random()
        )
        logs.append(log)
    }
    
    return logs
}

private func generateAppointments() -> [Appointment] {
    let calendar = Calendar.current
    let today = Date()
    var appointments: [Appointment] = []
    
    let appointmentDates = [
        (daysFromNow: -25, status: "Completed"),
        (daysFromNow: -15, status: "Completed"),
        (daysFromNow: -5, status: "Completed"),
        (daysFromNow: 3, status: "Scheduled"),
        (daysFromNow: 10, status: "Scheduled"),
        (daysFromNow: 21, status: "Scheduled")
    ]
    
    let doctorAppointments = [
        (doctor: "Dr. Ahmed Karim", specialty: "Cardiology", clinic: "Heart Care Clinic", time: "09:30"),
        (doctor: "Dr. Noor Al-Din", specialty: "Endocrinology", clinic: "Diabetes Care Center", time: "10:00"),
        (doctor: "Dr. Mona Rashad", specialty: "Internal Medicine", clinic: "Internal Medicine Practice", time: "14:30"),
        (doctor: "Dr. Hana Elmasry", specialty: "Obstetrics", clinic: "Obstetrics & Maternal Care", time: "15:00"),
        (doctor: "Dr. Karim Hassan", specialty: "Surgery", clinic: "Surgical Care Center", time: "11:00"),
        (doctor: "Dr. Rami Ibrahim", specialty: "Dermatology", clinic: "Skin Wellness Dermatology", time: "16:00")
    ]
    
    for (index, appointmentDate) in appointmentDates.enumerated() {
        let date = calendar.date(byAdding: .day, value: appointmentDate.daysFromNow, to: today) ?? today
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: date)
        
        let doctorInfo = doctorAppointments[index % doctorAppointments.count]
        
        let appointment = Appointment(
            doctorName: doctorInfo.doctor,
            specialty: doctorInfo.specialty,
            clinicName: doctorInfo.clinic,
            appointmentDate: dateString,
            appointmentTime: doctorInfo.time,
            status: appointmentDate.status,
            location: "Cairo, Egypt",
            notes: appointmentDate.status == "Completed" ? "Follow-up required in 3 months" : nil,
            patientId: "patient_001"
        )
        appointments.append(appointment)
    }
    
    return appointments.sorted { $0.appointmentDate > $1.appointmentDate }
}

// MARK: - SwiftUI Preview Helper
#if DEBUG
struct PreviewHelper {
    static let mockProvider = MockDataProvider.shared
    
    static var sampleDoctorModel: DoctorModel {
        mockProvider.doctors.first ?? DoctorModel(
            id: "doc_001",
            image: "https://via.placeholder.com/300x300?text=Doctor",
            name: "Dr. Sample",
            specilization: "General Practice",
            price: 200,
            location: "Cairo",
            ratingsAverage: 4.5
        )
    }
    
    static var sampleDoctorDetails: DoctorDetailsModel {
        mockProvider.doctorDetails.first ?? DoctorDetailsModel(
            data: Doctor(
                id: "doc_001",
                image: "https://via.placeholder.com/300x300?text=Doctor",
                name: "Dr. Sample",
                specilization: "General Practice",
                bio: "Experienced doctor",
                price: 200,
                location: "Cairo",
                isfavourite: false,
                isOnline: false,
                clinic: Clinic(
                    logo: "",
                    name: "Sample Clinic",
                    clinicPhotos: [],
                    specilization: "General",
                    price: 200,
                    location: "Cairo",
                    isfavourite: false,
                    ratingsAverage: 4.0,
                    id: "clinic_001"
                ),
                center: Center(
                    logo: "",
                    name: "Sample Center",
                    centerPhotos: [],
                    specilization: ["General"],
                    price: 200,
                    location: "Cairo",
                    isfavourite: false,
                    ratingsAverage: 4.0,
                    id: "center_001"
                ),
                ratingsAverage: 4.0,
                reviews: []
            )
        )
    }
    
    static var sampleClinics: [ClinicModel] {
        mockProvider.clinics
    }
    
    static var sampleCenters: [CenterModel] {
        mockProvider.centers
    }
    
    static var sampleVitals: [VitalRecord] {
        mockProvider.vitalsHistory
    }
    
    static var sampleLabResults: [LabResult] {
        mockProvider.labResults
    }
}
#endif
