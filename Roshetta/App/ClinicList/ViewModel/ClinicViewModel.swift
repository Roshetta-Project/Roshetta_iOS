//
//  ClinicViewModel.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 21/06/2024.
//

import Foundation

final class ClinicViewModel: ObservableObject {

    @Published var clinics: [ClinicModel] = []
    @Published var status: NetworkState = .loading

    private let useMockData: Bool

    init(useMockData: Bool = true) {
        self.useMockData = useMockData
        if useMockData {
            loadMock()
        }
    }

    @MainActor
    func getClinic() async {
        guard !useMockData else { return }
        // API logic (سيبه زي ما هو)
    }

    private func loadMock() {
        clinics = ClinicModel.mockList
        status = .success
    }
}
