//
//  MedicalDataViewModel.swift
//  Roshetta
//
//  Created on January 22, 2026
//  Template ViewModel for accessing medical records (Vitals, Lab Results, Medications, Appointments)

import Foundation
// Note: MockServices.swift is in the same target and provides:
// - MedicalDataServiceProtocol
// - ServiceFactory
// - MockMedicalDataService

@MainActor
class MedicalDataViewModel: ObservableObject {
    
    // MARK: - Published Properties
    
    @Published var vitalsHistory: [VitalRecord] = []
    @Published var labResults: [LabResult] = []
    @Published var medications: [MedicationLog] = []
    @Published var appointments: [Appointment] = []
    
    @Published var status: NetworkState = .loading
    @Published var selectedVitalDate: Date?
    
    // MARK: - Service Injection
    
    private let medicalDataService: MedicalDataServiceProtocol
    
    init(service: MedicalDataServiceProtocol? = nil) {
        #if DEBUG
        self.medicalDataService = service ?? ServiceFactory.createMedicalDataService()
        #else
        self.medicalDataService = service ?? ServiceFactory.createMedicalDataService()
        #endif
    }
    
    // MARK: - Data Fetching
    
    /// Fetch all medical data for a patient
    func loadAllMedicalData(patientId: String) async {
        status = .loading
        
        do {
            async let vitals = medicalDataService.getVitalsHistory(patientId: patientId)
            async let labs = medicalDataService.getLabResults(patientId: patientId)
            async let meds = medicalDataService.getMedications(patientId: patientId)
            async let appts = medicalDataService.getAppointments(patientId: patientId)
            
            let (fetchedVitals, fetchedLabs, fetchedMeds, fetchedAppts) = try await (vitals, labs, meds, appts)
            
            self.vitalsHistory = fetchedVitals
            self.labResults = fetchedLabs
            self.medications = fetchedMeds
            self.appointments = fetchedAppts
            self.status = .success
            
            print("✅ Loaded all medical data for patient: \(patientId)")
        } catch {
            status = .error(error.localizedDescription)
            print("❌ Error loading medical data: \(error.localizedDescription)")
        }
    }
    
    /// Fetch vitals history separately
    func getVitalsHistory(patientId: String) async {
        do {
            let vitals = try await medicalDataService.getVitalsHistory(patientId: patientId)
            self.vitalsHistory = vitals
            print("✅ Loaded \(vitals.count) vital records")
        } catch {
            print("❌ Error loading vitals: \(error.localizedDescription)")
        }
    }
    
    /// Fetch lab results separately
    func getLabResults(patientId: String) async {
        do {
            let labs = try await medicalDataService.getLabResults(patientId: patientId)
            self.labResults = labs
            print("✅ Loaded \(labs.count) lab results")
        } catch {
            print("❌ Error loading lab results: \(error.localizedDescription)")
        }
    }
    
    /// Fetch medications separately
    func getMedications(patientId: String) async {
        do {
            let meds = try await medicalDataService.getMedications(patientId: patientId)
            self.medications = meds
            print("✅ Loaded \(meds.count) medications")
        } catch {
            print("❌ Error loading medications: \(error.localizedDescription)")
        }
    }
    
    /// Fetch appointments separately
    func getAppointments(patientId: String) async {
        do {
            let appts = try await medicalDataService.getAppointments(patientId: patientId)
            self.appointments = appts
            print("✅ Loaded \(appts.count) appointments")
        } catch {
            print("❌ Error loading appointments: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Data Analysis
    
    /// Get latest vital signs
    var latestVitals: VitalRecord? {
        vitalsHistory.first
    }
    
    /// Get average heart rate for past 7 days
    var averageHeartRate7Days: Double? {
        let sevenDaysAgo = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        let recentVitals = vitalsHistory.filter { $0.timestamp >= sevenDaysAgo }
        
        guard !recentVitals.isEmpty else { return nil }
        return recentVitals.map { $0.heartRate }.reduce(0, +) / Double(recentVitals.count)
    }
    
    /// Get normal vitals (percentage)
    var normalVitalsPercentage: Double {
        guard !vitalsHistory.isEmpty else { return 0 }
        
        let normalCount = vitalsHistory.filter { vital in
            let hrNormal = vital.heartRate >= 60 && vital.heartRate <= 100
            let o2Normal = vital.oxygenSaturation >= 95
            return hrNormal && o2Normal
        }.count
        
        return Double(normalCount) / Double(vitalsHistory.count) * 100
    }
    
    /// Get upcoming appointments
    var upcomingAppointments: [Appointment] {
        appointments.filter { $0.appointmentDate >= Date() && $0.status == "Scheduled" }
            .sorted { $0.appointmentDate < $1.appointmentDate }
    }
    
    /// Get past appointments
    var pastAppointments: [Appointment] {
        appointments.filter { $0.appointmentDate < Date() || $0.status == "Completed" }
            .sorted { $0.appointmentDate > $1.appointmentDate }
    }
    
    /// Get abnormal lab results
    var abnormalLabResults: [LabResult] {
        labResults.filter { $0.status != "Normal" }
    }
    
    /// Get active medications
    var activeMedications: [MedicationLog] {
        medications.filter { !$0.medicationName.isEmpty }
    }
}

// MARK: - Preview Helper

#if DEBUG
struct MedicalDataViewModel_Preview {
    static let preview: MedicalDataViewModel = {
        let viewModel = MedicalDataViewModel(service: MockMedicalDataService())
        viewModel.vitalsHistory = MockDataProvider.instance.mockVitalsHistory
        viewModel.labResults = MockDataProvider.instance.mockLabResults
        viewModel.medications = MockDataProvider.instance.mockMedications
        viewModel.appointments = MockDataProvider.instance.mockAppointments
        return viewModel
    }()
}
#endif
