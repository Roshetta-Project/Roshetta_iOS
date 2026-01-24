//
//  CenterViewModel.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 22/06/2024.
//


import Foundation

import Foundation

final class CenterViewModel: ObservableObject {

    @Published var centers: [CenterModel] = []
    @Published var status: NetworkState = .loading

    private let useMockData: Bool

    init(useMockData: Bool = true) {
        self.useMockData = useMockData

        if useMockData {
            loadMock()
        }
    }

    @MainActor
    func getCenter() async {
        guard !useMockData else { return }

        // API Logic (سيبه زي ما هو)
        status = .loading
    }

    private func loadMock() {
        centers = CenterModel.mockList   // ← الـ 10 اللي عملناهُم
        status = .success
    }
}
