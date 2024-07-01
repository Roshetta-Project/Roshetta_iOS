//
//  CenterViewModel.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 22/06/2024.
//


import Foundation

class CenterViewModel: ObservableObject {
    
    @Published var centers: [CenterModel] = []
    @Published var status: NetworkState = .loading
    
    @MainActor
    func getCenter() async {
        if let user: UserModel = UserDefaults.standard.getUser(forKey: "cachedUser") {
            
            guard let url = URL(string: "https://roshetta-back.vercel.app/api/v1/centers") else { return }
            
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
                let centersResponse = try decoder.decode(CenterListModel.self, from: data)
                centers = centersResponse.data
                status = .success
            } catch {
                status = .error(error.localizedDescription)
            }
        }
    }
}


