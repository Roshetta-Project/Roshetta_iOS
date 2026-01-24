import Foundation

enum NetworkState {
    case loading
    case error(String)
    case success
}

final class DoctorViewModel: ObservableObject {

    @Published var doctors: [Doctor] = []
    @Published var filteredDoctors: [Doctor] = []

    @Published var status: NetworkState = .loading

    private let useMockData: Bool

    init(useMockData: Bool = true) {
        self.useMockData = useMockData
        if useMockData {
            loadMock()
        }
    }

    @MainActor
    func getDoctors() async {
        guard !useMockData else { return }

        status = .success
        // API logic
    }

    private func loadMock() {
        doctors = Doctor.mockList

        status = .success
    }
    func filter(by specialization: String) {
        filteredDoctors = doctors.filter {
            $0.specilization.lowercased() == specialization.lowercased()
        }
    }
    
}



