//
//  MockDataEnvironment.swift
//  Roshetta
//
//  Created by Senior iOS Engineer on 2026-01-22.
//
// Environment for injecting mock data into SwiftUI views

import SwiftUI

// MARK: - Mock Data Environment Key
struct MockDataEnvironmentKey: EnvironmentKey {
    static let defaultValue: MockDataEnvironment = MockDataEnvironment()
}

extension EnvironmentValues {
    var mockDataEnvironment: MockDataEnvironment {
        get { self[MockDataEnvironmentKey.self] }
        set { self[MockDataEnvironmentKey.self] = newValue }
    }
}

// MARK: - Mock Data Environment
class MockDataEnvironment: ObservableObject {
    @Published var currentUser: UserModel?
    @Published var doctors: [DoctorModel] = []
    @Published var clinics: [ClinicModel] = []
    @Published var centers: [CenterModel] = []
    @Published var vitalsHistory: [VitalRecord] = []
    @Published var labResults: [LabResult] = []
    @Published var medications: [MedicationLog] = []
    @Published var appointments: [Appointment] = []
    
    private let provider = MockDataProvider.shared
    
    init() {
        loadMockData()
    }
    
    func loadMockData() {
        currentUser = provider.patientUsers.randomElement()
        doctors = provider.doctors
        clinics = provider.clinics
        centers = provider.centers
        vitalsHistory = provider.vitalsHistory
        labResults = provider.labResults
        medications = provider.medications
        appointments = provider.appointments
    }
    
    func switchUser(to index: Int) {
        if index < provider.patientUsers.count {
            currentUser = provider.patientUsers[index]
        }
    }
    
    func getRandomDoctor() -> DoctorModel? {
        doctors.randomElement()
    }
    
    func getRandomClinic() -> ClinicModel? {
        clinics.randomElement()
    }
    
    func getRandomCenter() -> CenterModel? {
        centers.randomElement()
    }
}

// MARK: - View Modifier for Easy Preview Integration
extension View {
    func withMockDataEnvironment() -> some View {
        self.environmentObject(MockDataEnvironment())
    }
}

// MARK: - Preview Wrapper
struct MockDataPreviewWrapper<Content: View>: View {
    let content: Content
    @StateObject private var mockEnvironment = MockDataEnvironment()
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .environmentObject(mockEnvironment)
    }
}

// MARK: - Realistic Data Statistics
extension MockDataEnvironment {
    
    var averageHeartRate: Double {
        let rates = vitalsHistory.map { Double($0.heartRate) }
        guard !rates.isEmpty else { return 0 }
        return rates.reduce(0, +) / Double(rates.count)
    }
    
    var averageBP: (systolic: Double, diastolic: Double) {
        let systolic = vitalsHistory.map { Double($0.systolicBP) }
        let diastolic = vitalsHistory.map { Double($0.diastolicBP) }
        
        let avgSystolic = systolic.isEmpty ? 0 : systolic.reduce(0, +) / Double(systolic.count)
        let avgDiastolic = diastolic.isEmpty ? 0 : diastolic.reduce(0, +) / Double(diastolic.count)
        
        return (avgSystolic, avgDiastolic)
    }
    
    var averageOxygenSaturation: Double {
        let readings = vitalsHistory.map { $0.oxygenSaturation }
        guard !readings.isEmpty else { return 0 }
        return readings.reduce(0, +) / Double(readings.count)
    }
    
    var abnormalLabResults: [LabResult] {
        labResults.filter { $0.status != "Normal" }
    }
    
    var completedAppointments: [Appointment] {
        appointments.filter { $0.status == "Completed" }
    }
    
    var upcomingAppointments: [Appointment] {
        appointments.filter { $0.status == "Scheduled" }
    }
    
    var medicationAdherence: Double {
        let taken = medications.filter { $0.takenToday }.count
        guard !medications.isEmpty else { return 0 }
        return Double(taken) / Double(medications.count) * 100
    }
}

// MARK: - Data Formatting Helpers
extension VitalRecord {
    var bloodPressureString: String {
        "\(systolicBP)/\(diastolicBP) mmHg"
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        if let date = DateFormatter().date(from: date) {
            return formatter.string(from: date)
        }
        return date
    }
}

extension LabResult {
    var statusColor: Color {
        switch status {
        case "High":
            return .red
        case "Low":
            return .orange
        default:
            return .green
        }
    }
    
    var formattedValue: String {
        String(format: "%.2f %@", value, unit)
    }
    
    var formattedResultDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        if let date = DateFormatter().date(from: resultDate) {
            return formatter.string(from: date)
        }
        return resultDate
    }
}

extension MedicationLog {
    var formattedStartDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        if let date = DateFormatter().date(from: startDate) {
            return formatter.string(from: date)
        }
        return startDate
    }
    
    var isActive: Bool {
        endDate == nil || {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            if let endDate = formatter.date(from: endDate ?? ""),
               endDate >= Date() {
                return true
            }
            return false
        }()
    }
}

extension Appointment {
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        if let date = DateFormatter().date(from: appointmentDate) {
            return formatter.string(from: date)
        }
        return appointmentDate
    }
    
    var statusColor: Color {
        switch status {
        case "Completed":
            return .green
        case "Cancelled":
            return .red
        default:
            return .blue
        }
    }
}
