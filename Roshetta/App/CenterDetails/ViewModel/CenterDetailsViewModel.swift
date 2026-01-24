//
//  CenterDetailsViewModel.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 30/06/2024.
//

import Foundation

final class CenterDetailsViewModel: ObservableObject {

    @Published var center: CenterDetailsModel?
    @Published var status: NetworkState = .loading

    private let useMockData: Bool

    init(useMockData: Bool = true) {
        self.useMockData = useMockData
    }

    @MainActor
    func getCenters(id: String) async {

        if useMockData {
            center = CenterDetailsModel.mock(id: id)
            status = center == nil ? .error("Center not found") : .success
            return
        }

        // API logic (سيبه زي ما هو)
    }
}
