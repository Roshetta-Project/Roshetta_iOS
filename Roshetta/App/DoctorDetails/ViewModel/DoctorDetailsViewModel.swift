//
//  DoctorDetailsViewModel.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-06-20.
//

import Foundation

class DoctorDetailsViewModel: ObservableObject {
    
    @Published var doctor: DoctorDetailsModel?
    @Published var status: NetworkState = .loading
        
    @MainActor
    func getDoctors(id: String) async {
        guard let url = URL(string: "https://roshetta-back.vercel.app/api/v1/doctors/\(id)") else { return }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YzU2MTEyOGQwMjM1YjJlNDk5M2I0ZiIsImlhdCI6MTcxMjAwMDAxMiwiZXhwIjoxNzE5Nzc2MDEyfQ.DBtZ_TDlJHnIp1arezAMwtV_-vb-GJ5L1kHMREg3yZ8",
            forHTTPHeaderField: "Authorization")

        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Response is ---")
               print(jsonString)
            }
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decoder = JSONDecoder()
            let doctorResponse = try decoder.decode(DoctorDetailsModel.self, from: data)
            doctor = doctorResponse
            if doctor != nil {
                status = .success
            } else {
                status = .error("Doctor not found")
            }
        } catch {
            status = .error(error.localizedDescription)
        }
    }

}
