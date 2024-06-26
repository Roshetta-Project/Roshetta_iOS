//
//  ClinicViewModel.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 21/06/2024.
//

import Foundation

class ClinicViewModel: ObservableObject {
    
    @Published var clinics: [ClinicModel] = []
    @Published var status: NetworkState = .loading
    
    @MainActor
    func getClinic() async {
        if let user: UserModel = UserDefaults.standard.getUser(forKey: "cachedUser") {
            
            guard let url = URL(string: "https://roshetta-back.vercel.app/api/v1/clinics") else { return }
            
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
                
                let decoder = JSONDecoder()
                let clinicsResponse = try decoder.decode(ClinicListModel.self, from: data)
                clinics = clinicsResponse.data
                status = .success
            } catch {
                status = .error(error.localizedDescription)
            }
        }
    }
}
