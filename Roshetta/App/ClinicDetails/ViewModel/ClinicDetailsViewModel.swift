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
        if let user: UserModel = UserDefaults.standard.getUser(forKey: "cachedUser") {
            
            guard let url = URL(string: "https://roshetta-back.vercel.app/api/v1/clinics/\(id)") else { return }
            
            var request = URLRequest(url: url)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue(
                "Bearer \(user.data.token)",
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

}
