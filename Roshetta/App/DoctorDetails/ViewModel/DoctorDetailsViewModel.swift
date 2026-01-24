//
//  DoctorDetailsViewModel.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-06-20.
//

import Foundation

final class DoctorDetailsViewModel: ObservableObject {

    @Published var doctor: DoctorDetailsModel?
    @Published var status: NetworkState = .loading

    private let useMockData: Bool

    init(useMockData: Bool = true) {
        self.useMockData = useMockData
    }

    @MainActor
    func getDoctors(id: String) async {

        if useMockData {
            loadMock(id: id)
            return
        }

        // API logic الحقيقي (سيبه زي ما هو)
    }

    private func loadMock(id: String) {
        if let mock = DoctorDetailsModel.mock(id: id) {
            doctor = mock
            status = .success
        } else {
            status = .error("Doctor not found")
        }
    }
}
