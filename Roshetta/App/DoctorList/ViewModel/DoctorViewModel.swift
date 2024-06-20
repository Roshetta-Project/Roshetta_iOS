//
//  DoctorViewModel.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-06-20.
//

import Foundation

enum NetworkState {
    case loading, error(String), success
}

class DoctorViewModel: ObservableObject {
    
    @Published var doctors: [DoctorModel] = []
    @Published var status: NetworkState = .loading
        
    @MainActor
    func getDoctors() async {
        guard let url = URL(string: "https://roshetta-wy5u.onrender.com/api/v1/doctors") else { return }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YzU2MTEyOGQwMjM1YjJlNDk5M2I0ZiIsImlhdCI6MTcxMjAwMDAxMiwiZXhwIjoxNzE5Nzc2MDEyfQ.DBtZ_TDlJHnIp1arezAMwtV_-vb-GJ5L1kHMREg3yZ8",
            forHTTPHeaderField: "Authorization")

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decoder = JSONDecoder()
            let doctorsResponse = try decoder.decode(DoctorListModel.self, from: data)
            doctors = doctorsResponse.data
            status = .success
        } catch {
            status = .error(error.localizedDescription)
        }
    }
}