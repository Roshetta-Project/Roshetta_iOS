//
//  CenterDetailsViewModel.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 30/06/2024.
//

import Foundation

class CenterDetailsViewModel: ObservableObject {
    @Published var center: CenterDetailsModel?
    @Published var status: NetworkState = .loading
    
    @MainActor
    func getCenters(id: String) async {
        guard let url = URL(string: "https://roshetta-back.vercel.app/api/v1/centers/\(id)") else { return }
        
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
            let centerResponse = try decoder.decode(CenterDetailsModel.self, from: data)
            center = centerResponse
            if center != nil {
                status = .success
            } else {
                status = .error("Clinic not found")
            }
        } catch {
            status = .error(error.localizedDescription)
        }
    }
}
