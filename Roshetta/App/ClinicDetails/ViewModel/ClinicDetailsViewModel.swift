//
//  ClinicDetailsViewModel.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 21/06/2024.
//

import Foundation

class ClinicDetailsViewModel: ObservableObject {
    
    @Published var clinic: ClinicDetailsModel?
    @Published var status: NetworkState = .loading
        
    @MainActor
    func getDoctors(id: String) async {
        guard let url = URL(string: "https://roshetta-back.vercel.app/api/v1/clinics/\(id)") else { return }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YzU2MTEyOGQwMjM1YjJlNDk5M2I0ZiIsImlhdCI6MTcxOTc3OTY1NCwiZXhwIjoxNzI3NTU1NjU0fQ.GZcibPXxYgHCakpxWjbRoPIFx2PfSF14mLYgyowqCIg",
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
            let clinicResponse = try decoder.decode(ClinicDetailsModel.self, from: data)
            clinic = clinicResponse
            if clinic != nil {
                status = .success
            } else {
                status = .error("Clinic not found")
            }
        } catch {
            status = .error(error.localizedDescription)
        }
    }

}
