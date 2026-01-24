import SwiftUI

struct DoctorListView: View {

    @StateObject private var viewModel: DoctorViewModel
    let specialization: String?

    private let grids = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    init(
        specialization: String? = nil,
        viewModel: DoctorViewModel = DoctorViewModel(useMockData: true)
    ) {
        self.specialization = specialization
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        content
            .navigationTitle(specialization ?? "Doctors")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                if let specialization {
                    viewModel.filter(by: specialization)
                }
            }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.status {
        case .loading:
            ProgressView()

        case .error(let error):
            Text("Error: \(error)")

        case .success:
            ScrollView {
                LazyVGrid(columns: grids, spacing: 12) {
                    ForEach(
                        specialization == nil
                        ? viewModel.doctors
                        : viewModel.filteredDoctors
                    ) { doctor in
                        NavigationLink {
                            DoctorDetailsView(id: doctor.id)
                        } label: {
                            DoctorCard(
                                image: doctor.image,
                                name: doctor.name,
                                specialization: doctor.specilization,
                                rate: Int(doctor.ratingsAverage),
                                price: "\(doctor.price)",
                                location: doctor.location
                            )
                        }
                    }
                }
                .padding()
            }
            .navigationTitle(specialization ?? "Doctors")
        }
    }
}
