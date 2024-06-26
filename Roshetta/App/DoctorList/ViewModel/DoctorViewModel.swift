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

@MainActor
class DoctorViewModel: ObservableObject {
    
    @Published var doctors: [DoctorModel] = []
    @Published var status: NetworkState = .loading
    
    // Fillter Key ->
    func getDoctors() async {
        if let user: UserModel = UserDefaults.standard.getUser(forKey: "cachedUser") {
            
            guard let url = URL(string: "https://roshetta-back.vercel.app/api/v1/doctors") else {
                status = .error("Invalid URL")
                return
            }
            
            var request = URLRequest(url: url)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue(
                "Bearer \(user.data.token)",
                forHTTPHeaderField: "Authorization")
            
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Response is ---")
                    print(jsonString)
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
}
