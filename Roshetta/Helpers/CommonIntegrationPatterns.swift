//
//  CommonIntegrationPatterns.swift
//  Roshetta
//
//  Created by Senior iOS Engineer on 2026-01-22.
//
// Copy-paste integration patterns for common use cases

import SwiftUI

// MARK: - PATTERN 1: Adding Mock Data to Existing View

// Before:
//struct DoctorListView: View {
//    var body: some View {
//        List {
//            ForEach(0..<5) { index in
//                Text("Doctor \(index)")
//            }
//        }
//    }
//}

// After:
struct DoctorListView_WithMockData: View {
    @EnvironmentObject var mockEnvironment: MockDataEnvironment  // ← Add this
    
    var body: some View {
        List(mockEnvironment.doctors) { doctor in  // ← Use this instead of hardcoded data
            Text(doctor.name)
        }
    }
}

#Preview {
    DoctorListView_WithMockData()
        .environmentObject(MockDataEnvironment())  // ← Add to preview
}

// MARK: - PATTERN 2: Search Integration

struct DoctorListWithSearch: View {
    @EnvironmentObject var mockEnvironment: MockDataEnvironment
    @State private var searchText = ""
    
    var filteredDoctors: [DoctorModel] {
        if searchText.isEmpty {
            return mockEnvironment.doctors
        }
        return mockEnvironment.doctors.filter { doctor in
            doctor.name.localizedCaseInsensitiveContains(searchText) ||
            doctor.specilization.localizedCaseInsensitiveContains(searchText) ||
            doctor.location.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                
                List(filteredDoctors) { doctor in
                    DoctorRow(doctor: doctor)
                }
            }
            .navigationTitle("Doctors")
        }
    }
}

// MARK: - PATTERN 3: Sorting and Filtering

struct FilteredDoctorList: View {
    @EnvironmentObject var mockEnvironment: MockDataEnvironment
    @State private var sortBy: SortOption = .rating
    
    enum SortOption {
        case name, rating, price
    }
    
    var sortedDoctors: [DoctorModel] {
        switch sortBy {
        case .name:
            return mockEnvironment.doctors.sorted { $0.name < $1.name }
        case .rating:
            return mockEnvironment.doctors.sorted { $0.ratingsAverage > $1.ratingsAverage }
        case .price:
            return mockEnvironment.doctors.sorted { $0.price < $1.price }
        }
    }
    
    var body: some View {
        VStack {
            Picker("Sort By", selection: $sortBy) {
                Text("Name").tag(SortOption.name)
                Text("Rating").tag(SortOption.rating)
                Text("Price").tag(SortOption.price)
            }
            .pickerStyle(.segmented)
            .padding()
            
            List(sortedDoctors) { doctor in
                DoctorRow(doctor: doctor)
            }
        }
    }
}

// MARK: - PATTERN 4: Pagination

struct PaginatedDoctorList: View {
    @EnvironmentObject var mockEnvironment: MockDataEnvironment
    @State private var itemsPerPage = 5
    @State private var currentPage = 0
    
    var paginatedDoctors: [DoctorModel] {
        let start = currentPage * itemsPerPage
        let end = min(start + itemsPerPage, mockEnvironment.doctors.count)
        return Array(mockEnvironment.doctors[start..<end])
    }
    
    var totalPages: Int {
        (mockEnvironment.doctors.count + itemsPerPage - 1) / itemsPerPage
    }
    
    var body: some View {
        VStack {
            List(paginatedDoctors) { doctor in
                DoctorRow(doctor: doctor)
            }
            
            HStack {
                Button("Previous") {
                    if currentPage > 0 { currentPage -= 1 }
                }
                .disabled(currentPage == 0)
                
                Spacer()
                Text("Page \(currentPage + 1) of \(totalPages)")
                Spacer()
                
                Button("Next") {
                    if currentPage < totalPages - 1 { currentPage += 1 }
                }
                .disabled(currentPage == totalPages - 1)
            }
            .padding()
        }
    }
}

// MARK: - PATTERN 5: State Management

class DoctorListViewModel: ObservableObject {
    @Published var doctors: [DoctorModel] = []
    @Published var selectedDoctor: DoctorModel?
    @Published var isLoading = false
    
    func loadDoctors(from environment: MockDataEnvironment) {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.doctors = environment.doctors
            self.isLoading = false
        }
    }
}

struct DoctorListWithViewModel: View {
    @EnvironmentObject var mockEnvironment: MockDataEnvironment
    @StateObject var viewModel = DoctorListViewModel()
    
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
        } else {
            List(viewModel.doctors) { doctor in
                DoctorRow(doctor: doctor)
                    .onTapGesture {
                        viewModel.selectedDoctor = doctor
                    }
            }
            .navigationDestination(item: $viewModel.selectedDoctor) { doctor in
                DoctorDetailView(doctor: doctor)
            }
        }
        .onAppear {
            viewModel.loadDoctors(from: mockEnvironment)
        }
    }
}

// MARK: - PATTERN 6: Combining Multiple Data Sources

struct DashboardWithMultipleDataSources: View {
    @EnvironmentObject var mockEnvironment: MockDataEnvironment
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Doctors Section
                Section(header: Text("Top Doctors")) {
                    ForEach(mockEnvironment.doctors.prefix(3)) { doctor in
                        DoctorRow(doctor: doctor)
                    }
                }
                
                // Clinics Section
                Section(header: Text("Featured Clinics")) {
                    ForEach(mockEnvironment.clinics.prefix(3)) { clinic in
                        ClinicRow(clinic: clinic)
                    }
                }
                
                // Vitals Section
                if let latestVital = mockEnvironment.vitalsHistory.first {
                    Section(header: Text("Your Latest Vitals")) {
                        VitalRow(vital: latestVital)
                    }
                }
                
                // Appointments Section
                Section(header: Text("Upcoming Appointments")) {
                    ForEach(mockEnvironment.upcomingAppointments.prefix(2)) { appointment in
                        AppointmentRow(appointment: appointment)
                    }
                }
            }
            .padding()
        }
    }
}

// MARK: - PATTERN 7: Conditional Data Display

struct ConditionalDataDisplay: View {
    @EnvironmentObject var mockEnvironment: MockDataEnvironment
    
    var body: some View {
        VStack {
            if mockEnvironment.doctors.isEmpty {
                ContentUnavailableView(
                    "No Doctors Available",
                    systemImage: "doc.fill",
                    description: Text("Check back soon for available doctors")
                )
            } else {
                List(mockEnvironment.doctors) { doctor in
                    DoctorRow(doctor: doctor)
                }
            }
            
            if mockEnvironment.abnormalLabResults.isEmpty {
                Text("All labs normal ✓")
                    .foregroundColor(.green)
            } else {
                Text("⚠️ \(mockEnvironment.abnormalLabResults.count) abnormal results")
                    .foregroundColor(.red)
            }
        }
    }
}

// MARK: - PATTERN 8: Data Statistics Display

struct StatisticsView: View {
    @EnvironmentObject var mockEnvironment: MockDataEnvironment
    
    var body: some View {
        VStack(spacing: 16) {
            // Vital Statistics
            HStack(spacing: 12) {
                StatCard(
                    title: "Avg Heart Rate",
                    value: String(format: "%.0f", mockEnvironment.averageHeartRate),
                    unit: "bpm"
                )
                StatCard(
                    title: "Avg BP",
                    value: String(format: "%.0f/%.0f",
                        mockEnvironment.averageBP.systolic,
                        mockEnvironment.averageBP.diastolic),
                    unit: "mmHg"
                )
                StatCard(
                    title: "Avg O₂",
                    value: String(format: "%.1f", mockEnvironment.averageOxygenSaturation),
                    unit: "%"
                )
            }
            
            // Data Counts
            HStack(spacing: 12) {
                CountCard(label: "Doctors", count: mockEnvironment.doctors.count)
                CountCard(label: "Clinics", count: mockEnvironment.clinics.count)
                CountCard(label: "Medications", count: mockEnvironment.medications.count)
            }
            
            // Metrics
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Lab Results (Abnormal)")
                    Spacer()
                    Text(String(mockEnvironment.abnormalLabResults.count))
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
                
                HStack {
                    Text("Medication Adherence")
                    Spacer()
                    Text(String(format: "%.0f%%", mockEnvironment.medicationAdherence))
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                }
                
                HStack {
                    Text("Appointments (Upcoming)")
                    Spacer()
                    Text(String(mockEnvironment.upcomingAppointments.count))
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
        }
        .padding()
    }
}

// MARK: - PATTERN 9: Multi-Patient Switching

struct MultiPatientSwitcher: View {
    @StateObject private var mockEnvironment = MockDataEnvironment()
    @State private var selectedPatient = 0
    
    let patientNames = ["Ahmed Hassan", "Fatima Al-Mansouri", "Mohamed Saleh", "Layla Ibrahim"]
    
    var body: some View {
        VStack {
            Picker("Select Patient", selection: $selectedPatient) {
                ForEach(0..<patientNames.count, id: \.self) { index in
                    Text(patientNames[index]).tag(index)
                }
            }
            .onChange(of: selectedPatient) { newValue in
                mockEnvironment.switchUser(to: newValue)
            }
            .pickerStyle(.segmented)
            .padding()
            
            if let patient = mockEnvironment.currentUser {
                VStack(alignment: .leading) {
                    Text("Patient: \(patient.data.user.name)")
                        .font(.headline)
                    Text("Email: \(patient.data.user.email)")
                        .font(.subheadline)
                    Text("Age: \(calculateAge(from: patient.data.user.MedicalHistory?.dateOfBirth ?? "")) years")
                        .font(.subheadline)
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(8)
                .padding()
            }
            
            Spacer()
        }
    }
    
    private func calculateAge(from dateString: String) -> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let birthDate = formatter.date(from: dateString) {
            return Calendar.current.dateComponents([.year], from: birthDate, to: Date()).year ?? 0
        }
        return 0
    }
}

// MARK: - PATTERN 10: Testing Data Consistency

struct DataConsistencyCheckView: View {
    @EnvironmentObject var mockEnvironment: MockDataEnvironment
    
    var consistencyChecks: [ConsistencyCheck] {
        var checks: [ConsistencyCheck] = []
        
        // Check 1: All doctors have valid data
        let validDoctors = mockEnvironment.doctors.filter { 
            !$0.name.isEmpty && !$0.specilization.isEmpty && $0.price > 0
        }
        checks.append(ConsistencyCheck(
            name: "Doctors Valid",
            passed: validDoctors.count == mockEnvironment.doctors.count
        ))
        
        // Check 2: All vitals have reasonable ranges
        let validVitals = mockEnvironment.vitalsHistory.filter { vital in
            vital.heartRate >= 40 && vital.heartRate <= 150 &&
            vital.oxygenSaturation >= 90 && vital.oxygenSaturation <= 100
        }
        checks.append(ConsistencyCheck(
            name: "Vitals Valid",
            passed: validVitals.count == mockEnvironment.vitalsHistory.count
        ))
        
        // Check 3: All lab results have values
        let validLabs = mockEnvironment.labResults.filter { $0.value > 0 }
        checks.append(ConsistencyCheck(
            name: "Lab Results Valid",
            passed: validLabs.count == mockEnvironment.labResults.count
        ))
        
        // Check 4: All medications have dosages
        let validMeds = mockEnvironment.medications.filter { !$0.dosage.isEmpty }
        checks.append(ConsistencyCheck(
            name: "Medications Valid",
            passed: validMeds.count == mockEnvironment.medications.count
        ))
        
        return checks
    }
    
    var body: some View {
        VStack {
            Text("Data Consistency Checks")
                .font(.headline)
                .padding()
            
            List(consistencyChecks) { check in
                HStack {
                    Image(systemName: check.passed ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(check.passed ? .green : .red)
                    Text(check.name)
                    Spacer()
                    Text(check.passed ? "PASS" : "FAIL")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(check.passed ? .green : .red)
                }
            }
        }
    }
}

struct ConsistencyCheck: Identifiable {
    let id = UUID()
    let name: String
    let passed: Bool
}

// MARK: - Supporting Components

struct DoctorRow: View {
    let doctor: DoctorModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(doctor.name)
                    .fontWeight(.semibold)
                Text(doctor.specilization)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            VStack(alignment: .trailing) {
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(String(format: "%.1f", doctor.ratingsAverage))
                }
                Text("£\(doctor.price)")
                    .fontWeight(.semibold)
            }
        }
    }
}

struct ClinicRow: View {
    let clinic: ClinicModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(clinic.name)
                    .fontWeight(.semibold)
                Text(clinic.specilization)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
        }
    }
}

struct StatCard: View {
    let title: String
    let value: String
    let unit: String
    
    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            HStack(spacing: 2) {
                Text(value)
                    .font(.headline)
                Text(unit)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

struct CountCard: View {
    let label: String
    let count: Int
    
    var body: some View {
        VStack {
            Text(String(count))
                .font(.title2)
                .fontWeight(.bold)
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(8)
    }
}

struct VitalRow: View {
    let vital: VitalRecord
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(vital.formattedDate)
                    .fontWeight(.semibold)
                Spacer()
                Text(vital.timestamp)
                    .foregroundColor(.gray)
            }
            HStack {
                Label(String(vital.heartRate), systemImage: "heart.fill")
                Spacer()
                Label(vital.bloodPressureString, systemImage: "gauge.medium")
                Spacer()
                Label(String(format: "%.1f%%", vital.oxygenSaturation), systemImage: "lung.fill")
            }
            .font(.caption)
        }
    }
}

struct AppointmentRow: View {
    let appointment: Appointment
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(appointment.doctorName)
                    .fontWeight(.semibold)
                Text(appointment.clinicName)
                    .font(.caption)
                    .foregroundColor(.gray)
                HStack(spacing: 8) {
                    Image(systemName: "calendar")
                    Text(appointment.formattedDate)
                }
                .font(.caption2)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(appointment.appointmentTime)
                    .fontWeight(.semibold)
                Text(appointment.status)
                    .font(.caption)
                    .foregroundColor(appointment.statusColor)
            }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    var placeholder: String = "Search..."
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField(placeholder, text: $text)
            
            if !text.isEmpty {
                Button(action: { text = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(10)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

struct DoctorDetailView: View {
    let doctor: DoctorModel
    var body: some View {
        Text(doctor.name)
    }
}

#Preview {
    DashboardWithMultipleDataSources()
        .environmentObject(MockDataEnvironment())
}
