//
//  VIEWMODEL_UPDATE_EXAMPLES.swift
//  Roshetta
//
//  Created on January 22, 2026
//
//  Shows how to update remaining ViewModels to use MockServices.
//  Copy and adapt these patterns for your specific ViewModels.

// ============================================================================
// TEMPLATE 1: DoctorDetailsViewModel
// ============================================================================

/*
 //
 //  DoctorDetailsViewModel.swift
 //  Roshetta
 //
 
 import Foundation
 
 @MainActor
 class DoctorDetailsViewModel: ObservableObject {
     
     @Published var doctor: DoctorModel?
     @Published var status: NetworkState = .loading
     
     // ✨ ADD THIS
     private let doctorService: DoctorServiceProtocol
     
     // ✨ ADD THIS INITIALIZER
     init(doctorId: String, service: DoctorServiceProtocol? = nil) {
         self.doctorService = service ?? ServiceFactory.createDoctorService()
         self.doctorId = doctorId
     }
     
     private var doctorId: String
     
     // ✨ ADD THIS METHOD
     func loadDoctorDetails() async {
         status = .loading
         
         do {
             let doctor = try await doctorService.getDoctorDetails(id: doctorId)
             self.doctor = doctor
             self.status = .success
             print("✅ Loaded doctor: \(doctor?.name ?? "Unknown")")
         } catch {
             status = .error(error.localizedDescription)
             print("❌ Error loading doctor: \(error.localizedDescription)")
         }
     }
 }
 
 // In view, call it like:
 // DoctorDetailsView()
 //     .environmentObject(DoctorDetailsViewModel(doctorId: selectedDoctor.id))
 //     .task {
 //         await viewModel.loadDoctorDetails()
 //     }
 */

// ============================================================================
// TEMPLATE 2: ClinicDetailsViewModel
// ============================================================================

/*
 //
 //  ClinicDetailsViewModel.swift
 //  Roshetta
 //
 
 import Foundation
 
 @MainActor
 class ClinicDetailsViewModel: ObservableObject {
     
     @Published var clinic: ClinicModel?
     @Published var status: NetworkState = .loading
     
     // ✨ ADD THIS
     private let clinicService: ClinicServiceProtocol
     
     // ✨ ADD THIS INITIALIZER
     init(clinicId: String, service: ClinicServiceProtocol? = nil) {
         self.clinicService = service ?? ServiceFactory.createClinicService()
         self.clinicId = clinicId
     }
     
     private var clinicId: String
     
     // ✨ ADD THIS METHOD
     func loadClinicDetails() async {
         status = .loading
         
         do {
             let clinic = try await clinicService.getClinicDetails(id: clinicId)
             self.clinic = clinic
             self.status = .success
             print("✅ Loaded clinic: \(clinic?.name ?? "Unknown")")
         } catch {
             status = .error(error.localizedDescription)
             print("❌ Error loading clinic: \(error.localizedDescription)")
         }
     }
 }
 */

// ============================================================================
// TEMPLATE 3: CenterDetailsViewModel
// ============================================================================

/*
 //
 //  CenterDetailsViewModel.swift
 //  Roshetta
 //
 
 import Foundation
 
 @MainActor
 class CenterDetailsViewModel: ObservableObject {
     
     @Published var center: CenterModel?
     @Published var status: NetworkState = .loading
     
     // ✨ ADD THIS
     private let centerService: CenterServiceProtocol
     
     // ✨ ADD THIS INITIALIZER
     init(centerId: String, service: CenterServiceProtocol? = nil) {
         self.centerService = service ?? ServiceFactory.createCenterService()
         self.centerId = centerId
     }
     
     private var centerId: String
     
     // ✨ ADD THIS METHOD
     func loadCenterDetails() async {
         status = .loading
         
         do {
             let center = try await centerService.getCenterDetails(id: centerId)
             self.center = center
             self.status = .success
             print("✅ Loaded center: \(center?.name ?? "Unknown")")
         } catch {
             status = .error(error.localizedDescription)
             print("❌ Error loading center: \(error.localizedDescription)")
         }
     }
 }
 */

// ============================================================================
// TEMPLATE 4: Generic List ViewModel (For Any Model)
// ============================================================================

/*
 //
 //  GenericListViewModel.swift
 //  Roshetta
 //
 //  Use this template for any list-based ViewModel
 
 import Foundation
 
 @MainActor
 class GenericListViewModel<T>: ObservableObject {
     
     @Published var items: [T] = []
     @Published var status: NetworkState = .loading
     @Published var searchText: String = ""
     
     private let service: any YourServiceProtocol  // Replace with your service
     
     init(service: any YourServiceProtocol? = nil) {
         self.service = service ?? ServiceFactory.createYourService()
     }
     
     func loadItems() async {
         status = .loading
         
         do {
             self.items = try await service.getItems()  // Replace with your method
             self.status = .success
             print("✅ Loaded \(self.items.count) items")
         } catch {
             status = .error(error.localizedDescription)
             print("❌ Error loading items: \(error.localizedDescription)")
         }
     }
     
     var filteredItems: [T] {
         if searchText.isEmpty {
             return items
         }
         // Implement your filtering logic
         return items
     }
 }
 */

// ============================================================================
// TEMPLATE 5: Multiple Services in One ViewModel
// ============================================================================

/*
 //
 //  ComplexViewModel.swift
 //  Roshetta
 //
 //  Use this when you need data from multiple services
 
 import Foundation
 
 @MainActor
 class ComplexViewModel: ObservableObject {
     
     @Published var doctors: [DoctorModel] = []
     @Published var clinics: [ClinicModel] = []
     @Published var status: NetworkState = .loading
     
     private let doctorService: DoctorServiceProtocol
     private let clinicService: ClinicServiceProtocol
     
     init(
         doctorService: DoctorServiceProtocol? = nil,
         clinicService: ClinicServiceProtocol? = nil
     ) {
         self.doctorService = doctorService ?? ServiceFactory.createDoctorService()
         self.clinicService = clinicService ?? ServiceFactory.createClinicService()
     }
     
     // Load all data concurrently
     func loadAllData() async {
         status = .loading
         
         do {
             async let doctorsTask = doctorService.getDoctors()
             async let clinicsTask = clinicService.getClinics()
             
             let (fetchedDoctors, fetchedClinics) = try await (doctorsTask, clinicsTask)
             
             self.doctors = fetchedDoctors
             self.clinics = fetchedClinics
             self.status = .success
             
             print("✅ Loaded \(fetchedDoctors.count) doctors and \(fetchedClinics.count) clinics")
         } catch {
             status = .error(error.localizedDescription)
             print("❌ Error loading data: \(error.localizedDescription)")
         }
     }
     
     // Load separately when needed
     func loadDoctors() async {
         do {
             self.doctors = try await doctorService.getDoctors()
         } catch {
             print("❌ Error loading doctors: \(error.localizedDescription)")
         }
     }
     
     func loadClinics() async {
         do {
             self.clinics = try await clinicService.getClinics()
         } catch {
             print("❌ Error loading clinics: \(error.localizedDescription)")
         }
     }
 }
 */

// ============================================================================
// VIEW INTEGRATION EXAMPLES
// ============================================================================

/*
 // ============
 // EXAMPLE 1: Simple List View with Mock Service
 // ============
 
 struct DoctorListView: View {
     @StateObject private var viewModel = DoctorViewModel()
     
     var body: some View {
         NavigationStack {
             List(viewModel.doctors) { doctor in
                 NavigationLink(destination: DoctorDetailView(doctorId: doctor.id)) {
                     HStack(spacing: 12) {
                         AsyncImage(url: URL(string: doctor.image))
                             .frame(width: 60, height: 60)
                             .clipShape(Circle())
                         
                         VStack(alignment: .leading, spacing: 4) {
                             Text(doctor.name)
                                 .font(.headline)
                             Text(doctor.specialty)
                                 .font(.caption)
                                 .foregroundColor(.gray)
                         }
                         
                         Spacer()
                         
                         VStack(alignment: .trailing, spacing: 4) {
                             HStack(spacing: 2) {
                                 Image(systemName: "star.fill")
                                     .foregroundColor(.yellow)
                                 Text(String(format: "%.1f", doctor.rating))
                                     .font(.caption)
                             }
                             Text("₹\(doctor.consultationFee)")
                                 .font(.caption)
                                 .foregroundColor(.blue)
                         }
                     }
                 }
             }
             .navigationTitle("Doctors")
             .overlay {
                 if viewModel.doctors.isEmpty && viewModel.status == .loading {
                     ProgressView()
                 }
             }
         }
         .task {
             await viewModel.getDoctors()
         }
     }
 }
 
 // ============
 // EXAMPLE 2: Detail View with Mock Service
 // ============
 
 struct DoctorDetailView: View {
     let doctorId: String
     @StateObject private var viewModel = DoctorDetailsViewModel(doctorId: "")
     
     var body: some View {
         ScrollView {
             VStack(alignment: .leading, spacing: 16) {
                 if let doctor = viewModel.doctor {
                     // Header
                     AsyncImage(url: URL(string: doctor.image))
                         .frame(height: 250)
                         .clipped()
                     
                     // Info
                     VStack(alignment: .leading, spacing: 8) {
                         Text(doctor.name)
                             .font(.title2)
                             .bold()
                         
                         Text(doctor.specialty)
                             .font(.subheadline)
                             .foregroundColor(.blue)
                         
                         HStack {
                             Image(systemName: "star.fill")
                                 .foregroundColor(.yellow)
                             Text("\(String(format: "%.1f", doctor.rating)) (\(doctor.reviews) reviews)")
                             Spacer()
                             Text("₹\(doctor.consultationFee)/session")
                                 .font(.headline)
                         }
                         .font(.caption)
                     }
                     .padding()
                     
                     // Bio
                     VStack(alignment: .leading, spacing: 8) {
                         Text("About")
                             .font(.headline)
                         Text(doctor.bio)
                             .font(.body)
                     }
                     .padding()
                     
                     // Education
                     VStack(alignment: .leading, spacing: 8) {
                         Text("Education")
                             .font(.headline)
                         ForEach(doctor.education, id: \.self) { edu in
                             Text("• \(edu)")
                                 .font(.caption)
                         }
                     }
                     .padding()
                 }
             }
         }
         .navigationTitle("Doctor Profile")
         .task {
             await viewModel.loadDoctorDetails()
         }
     }
 }
 
 // ============
 // EXAMPLE 3: Complex View with Multiple Data Sources
 // ============
 
 struct HomeView: View {
     @StateObject private var complexVM = ComplexViewModel()
     
     var body: some View {
         ScrollView {
             VStack(spacing: 16) {
                 // Featured Doctors Section
                 VStack(alignment: .leading) {
                     Text("Top Doctors")
                         .font(.headline)
                     
                     ScrollView(.horizontal, showsIndicators: false) {
                         HStack {
                             ForEach(complexVM.doctors.prefix(5)) { doctor in
                                 VStack {
                                     AsyncImage(url: URL(string: doctor.image))
                                         .frame(width: 80, height: 80)
                                         .clipShape(Circle())
                                     Text(doctor.name)
                                         .font(.caption)
                                         .lineLimit(2)
                                 }
                             }
                         }
                     }
                 }
                 .padding()
                 
                 // Featured Clinics Section
                 VStack(alignment: .leading) {
                     Text("Popular Clinics")
                         .font(.headline)
                     
                     ForEach(complexVM.clinics.prefix(3)) { clinic in
                         HStack {
                             AsyncImage(url: URL(string: clinic.image))
                                 .frame(width: 60, height: 60)
                                 .cornerRadius(8)
                             
                             VStack(alignment: .leading) {
                                 Text(clinic.name)
                                     .font(.subheadline)
                                     .bold()
                                 Text(clinic.address)
                                     .font(.caption)
                                     .foregroundColor(.gray)
                             }
                         }
                     }
                 }
                 .padding()
             }
         }
         .task {
             await complexVM.loadAllData()
         }
     }
 }
 */

// ============================================================================
// PREVIEW EXAMPLES
// ============================================================================

/*
 // For SwiftUI Preview in DEBUG mode
 
 #if DEBUG
 struct DoctorListView_Previews: PreviewProvider {
     static var previews: some View {
         let mockService = MockDoctorService()
         let viewModel = DoctorViewModel(service: mockService)
         
         return DoctorListView()
             .environmentObject(viewModel)
     }
 }
 
 struct ComplexView_Previews: PreviewProvider {
     static var previews: some View {
         let mockDoctorService = MockDoctorService()
         let mockClinicService = MockClinicService()
         let viewModel = ComplexViewModel(
             doctorService: mockDoctorService,
             clinicService: mockClinicService
         )
         
         return HomeView()
             .environmentObject(viewModel)
     }
 }
 #endif
 */

