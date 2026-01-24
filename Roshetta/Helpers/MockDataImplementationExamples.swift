//
//  MockDataImplementationExamples.swift
//  Roshetta
//
//  Created by Senior iOS Engineer on 2026-01-22.
//
// Ready-to-copy implementation examples for common use cases

import SwiftUI

// MARK: - EXAMPLE 1: Doctor List with Mock Data
struct DoctorListWithMockData_Example: View {
    @EnvironmentObject var mockEnvironment: MockDataEnvironment
    @State private var searchText = ""
    
    var filteredDoctors: [DoctorModel] {
        if searchText.isEmpty {
            return mockEnvironment.doctors
        }
        return mockEnvironment.doctors.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.specilization.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Search doctors...")
                
                List(filteredDoctors) { doctor in
                    NavigationLink(destination: DoctorDetailsExample(doctorId: doctor.id)) {
                        HStack(spacing: 12) {
                            AsyncImage(url: URL(string: doctor.image)) { image in
                                image.resizable().scaledToFill()
                            } placeholder: {
                                Color.gray.opacity(0.3)
                            }
                            .frame(width: 60, height: 60)
                            .cornerRadius(8)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(doctor.name)
                                    .font(.headline)
                                Text(doctor.specilization)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                HStack {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                    Text(String(format: "%.1f", doctor.ratingsAverage))
                                        .font(.caption)
                                }
                            }
                            Spacer()
                            Text("£\(doctor.price)")
                                .font(.headline)
                        }
                        .padding(.vertical, 8)
                    }
                }
            }
            .navigationTitle("Doctors")
        }
    }
}

#Preview {
    DoctorListWithMockData_Example()
        .environmentObject(MockDataEnvironment())
}

// MARK: - EXAMPLE 2: Doctor Details View
struct DoctorDetailsExample: View {
    @EnvironmentObject var mockEnvironment: MockDataEnvironment
    let doctorId: String
    
    var doctor: DoctorModel? {
        mockEnvironment.doctors.first { $0.id == doctorId }
    }
    
    var body: some View {
        if let doctor = doctor {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Doctor Image
                    AsyncImage(url: URL(string: doctor.image)) { image in
                        image.resizable().scaledToFill()
                    } placeholder: {
                        Color.gray.opacity(0.3)
                    }
                    .frame(height: 300)
                    .cornerRadius(12)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(doctor.name)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(doctor.specilization)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(String(format: "%.1f", doctor.ratingsAverage))
                            Text("(120 reviews)")
                                .foregroundColor(.gray)
                        }
                        
                        HStack {
                            Image(systemName: "location.fill")
                                .foregroundColor(.red)
                            Text(doctor.location)
                        }
                        .foregroundColor(.gray)
                        
                        Text("Consultation Fee")
                            .font(.headline)
                        Text("£\(doctor.price)")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .padding()
                    
                    Divider()
                    
                    // Available Times (Mock)
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Available Times")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        HStack {
                            ForEach(["09:00", "10:30", "14:00", "15:30"], id: \.self) { time in
                                Button(time) { }
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .border(Color.gray.opacity(0.3))
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Button(action: {}) {
                        Text("Book Appointment")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()
                }
            }
        }
    }
}

// MARK: - EXAMPLE 3: Patient Dashboard
struct PatientDashboard_Example: View {
    @EnvironmentObject var mockEnvironment: MockDataEnvironment
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Patient Header
                    if let patient = mockEnvironment.currentUser {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Welcome")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text(patient.data.user.name)
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(12)
                    }
                    
                    // Vital Signs Summary
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Today's Vitals")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        HStack(spacing: 12) {
                            VitalStatCard(
                                label: "Heart Rate",
                                value: String(format: "%.0f", mockEnvironment.averageHeartRate),
                                unit: "bpm",
                                icon: "heart.fill",
                                color: .red
                            )
                            
                            VitalStatCard(
                                label: "BP",
                                value: String(format: "%.0f/%.0f",
                                    mockEnvironment.averageBP.systolic,
                                    mockEnvironment.averageBP.diastolic),
                                unit: "mmHg",
                                icon: "gauge.medium",
                                color: .orange
                            )
                            
                            VitalStatCard(
                                label: "O₂",
                                value: String(format: "%.1f", mockEnvironment.averageOxygenSaturation),
                                unit: "%",
                                icon: "lung.fill",
                                color: .blue
                            )
                        }
                        .padding(.horizontal)
                    }
                    
                    // Recent Lab Results
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Recent Lab Results")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        VStack(spacing: 8) {
                            ForEach(mockEnvironment.labResults.prefix(3)) { result in
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(result.testName)
                                            .font(.subheadline)
                                        Text(result.formattedResultDate)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                    HStack(spacing: 4) {
                                        Text(result.formattedValue)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                        Circle()
                                            .fill(result.statusColor)
                                            .frame(width: 8, height: 8)
                                    }
                                }
                                .padding()
                                .background(Color.gray.opacity(0.05))
                                .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Active Medications
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Current Medications")
                                .font(.headline)
                            Spacer()
                            Text("\(mockEnvironment.medications.count) active")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        
                        VStack(spacing: 8) {
                            ForEach(mockEnvironment.medications.prefix(4)) { med in
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(med.medicationName)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                        Text("\(med.dosage) • \(med.frequency)")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                    Image(systemName: med.takenToday ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(med.takenToday ? .green : .gray)
                                }
                                .padding()
                                .background(Color.gray.opacity(0.05))
                                .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Upcoming Appointments
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Upcoming Appointments")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        VStack(spacing: 8) {
                            ForEach(mockEnvironment.upcomingAppointments.prefix(2)) { appointment in
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(appointment.doctorName)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                        Text(appointment.clinicName)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                        HStack(spacing: 8) {
                                            Image(systemName: "calendar")
                                                .font(.caption)
                                            Text(appointment.formattedDate)
                                                .font(.caption)
                                            Image(systemName: "clock")
                                                .font(.caption)
                                            Text(appointment.appointmentTime)
                                                .font(.caption)
                                        }
                                        .foregroundColor(.gray)
                                    }
                                    Spacer()
                                }
                                .padding()
                                .background(Color.blue.opacity(0.05))
                                .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                        .frame(height: 20)
                }
                .padding(.vertical)
            }
            .navigationTitle("Health Dashboard")
        }
    }
}

#Preview {
    PatientDashboard_Example()
        .environmentObject(MockDataEnvironment())
}

// MARK: - EXAMPLE 4: Vitals Chart View
struct VitalsChartView_Example: View {
    @EnvironmentObject var mockEnvironment: MockDataEnvironment
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Heart Rate Trend")
                .font(.headline)
                .padding(.horizontal)
            
            // Simple heart rate display (replace with Charts framework for production)
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("Current")
                        .foregroundColor(.gray)
                    Spacer()
                    Text(String(format: "%.0f bpm", mockEnvironment.averageHeartRate))
                        .fontWeight(.bold)
                }
                
                HStack {
                    Text("Average (21 days)")
                        .foregroundColor(.gray)
                    Spacer()
                    Text(String(format: "%.0f bpm", mockEnvironment.averageHeartRate))
                        .fontWeight(.bold)
                }
                
                Divider()
                
                Text("Reading History")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(mockEnvironment.vitalsHistory.prefix(14)) { vital in
                            VStack(spacing: 4) {
                                Text(String(vital.heartRate))
                                    .font(.caption2)
                                    .fontWeight(.semibold)
                                
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.red.opacity(0.3))
                                    .frame(width: 30, height: CGFloat(vital.heartRate) / 2)
                                
                                Text(vital.date.split(separator: "-").last.map(String.init) ?? "")
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            }
                            .frame(width: 40)
                        }
                    }
                    .padding()
                }
                .background(Color.gray.opacity(0.05))
                .cornerRadius(8)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .padding(.horizontal)
        }
    }
}

#Preview {
    VitalsChartView_Example()
        .environmentObject(MockDataEnvironment())
}

// MARK: - EXAMPLE 5: Lab Results Detail View
struct LabResultsDetailView_Example: View {
    @EnvironmentObject var mockEnvironment: MockDataEnvironment
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                // Summary Statistics
                HStack(spacing: 12) {
                    StatBox(
                        title: "Total Tests",
                        value: String(mockEnvironment.labResults.count),
                        color: .blue
                    )
                    
                    StatBox(
                        title: "Abnormal",
                        value: String(mockEnvironment.abnormalLabResults.count),
                        color: .red
                    )
                    
                    StatBox(
                        title: "Normal",
                        value: String(mockEnvironment.labResults.filter { $0.status == "Normal" }.count),
                        color: .green
                    )
                }
                .padding()
                
                // Grouped Results
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(groupedLabResults(), id: \.key) { group in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(group.key)
                                    .font(.headline)
                                    .padding(.horizontal)
                                
                                VStack(spacing: 8) {
                                    ForEach(group.value) { result in
                                        LabResultRow(result: result)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Lab Results")
        }
    }
    
    private func groupedLabResults() -> [(String, [LabResult])] {
        let grouped = Dictionary(grouping: mockEnvironment.labResults) { result in
            // Group by date
            result.resultDate
        }
        return grouped.sorted { $0.key > $1.key }
    }
}

// MARK: - SUPPORTING VIEWS
struct VitalStatCard: View {
    let label: String
    let value: String
    let unit: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
            
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
            
            HStack(spacing: 2) {
                Text(value)
                    .font(.headline)
                Text(unit)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(12)
    }
}

struct StatBox: View {
    let title: String
    let value: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(color)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(color.opacity(0.1))
        .cornerRadius(8)
    }
}

struct LabResultRow: View {
    let result: LabResult
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(result.testName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                HStack(spacing: 8) {
                    Text("Ref: \(result.referenceRange)")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 4) {
                Text(result.formattedValue)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                HStack(spacing: 4) {
                    Image(systemName: "circle.fill")
                        .font(.caption2)
                        .foregroundColor(result.statusColor)
                    Text(result.status)
                        .font(.caption2)
                        .foregroundColor(result.statusColor)
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(8)
    }
}

// MARK: - EXAMPLES WITH PATIENT SWITCHING
struct MultiPatientExample: View {
    @StateObject private var mockEnvironment = MockDataEnvironment()
    @State private var currentPatientIndex = 0
    
    var body: some View {
        VStack {
            // Patient Selector
            Picker("Patient", selection: $currentPatientIndex) {
                Text("Ahmed Hassan").tag(0)
                Text("Fatima Al-Mansouri").tag(1)
                Text("Mohamed Saleh").tag(2)
                Text("Layla Ibrahim").tag(3)
            }
            .onChange(of: currentPatientIndex) { newValue in
                mockEnvironment.switchUser(to: newValue)
            }
            .pickerStyle(.segmented)
            .padding()
            
            // Dashboard for selected patient
            PatientDashboard_Example()
                .environmentObject(mockEnvironment)
        }
        .onAppear {
            mockEnvironment.switchUser(to: currentPatientIndex)
        }
    }
}

#Preview {
    MultiPatientExample()
}
