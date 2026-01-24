//
//  ClinicDetailsViewModel.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 21/06/2024.
//

import Foundation

final class ClinicDetailsViewModel: ObservableObject {

    @Published var clinic: ClinicDetailsModel?
    @Published var status: NetworkState = .loading

    private let useMockData: Bool

    init(useMockData: Bool = true) {
        self.useMockData = useMockData
    }

    @MainActor
    func getDoctors(id: String) async {
        if useMockData {
            clinic = ClinicDetailsModel.mock(id: id)
            status = clinic == nil ? .error("Clinic not found") : .success
            return
        }

        // API logic
    }
}
