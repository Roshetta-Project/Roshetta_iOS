//
//  AuthViewModel.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-22.
//

import SwiftUI

protocol AuthViewModelDependenciesProtocol {
  var useCase: AuthUseCaseProtocol { get }
}

enum LoginType {
    case facebook, google, apple
}

@MainActor
final class AuthViewModel: ObservableObject {
    // MARK: - CONSTANTS
    
    
    // MARK: - PROPERTYS
    
    private let useCase: AuthUseCaseProtocol
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var isSuccess: Bool = false

    // MARK: - LIFE CYCLE
    
    init(dependencies: AuthViewModelDependenciesProtocol) {
        self.useCase = dependencies.useCase
    }
    
    func login() async {
        do {
            var thirdPartyManagr = ThirdPartyManagr(loginStrategy: GoogleLogin())
            let token = try await thirdPartyManagr.getUserToken()
            print("user token is \(token ?? "")")
            let user: UserModel = Bundle.main.decode("user.json")
            UserDefaults.standard.setUser(user, forKey: "cachedUser")
            isSuccess = true
        } catch {
            print("Error")
        }
    }
}


struct UserModel: Codable {
    let status: String
    let data: UserDetails
}

struct UserDetails: Codable {
    let token: String
    let user: UserData
}

struct UserData: Codable {
    let name: String
    let email: String
    let MedicalHistory: MedicalHistoryResponseModel?
    let id: String
}



extension UserDefaults {
    func setUser(_ user: UserModel, forKey key: String) {
        if let encoded = try? JSONEncoder().encode(user) {
            self.set(encoded, forKey: key)
        }
    }
    
    func getUser(forKey key: String) -> UserModel? {
        if let data = self.data(forKey: key),
           let user = try? JSONDecoder().decode(UserModel.self, from: data) {
            return user
        }
        return nil
    }
}


// MARK: - AuthViewModelProtocol
extension AuthViewModel: AuthViewModelProtocol {
    func facebookLogin() async {
        isLoading = useCase.notifyLoading()
        do {
           try await useCase.execute(type: .facebook)
            isLoading = useCase.stopLoading()
        } catch {
            isError = true
            isLoading = useCase.stopLoading()
            errorMessage = error.localizedDescription
        }
    }
    
    func googleLogin() async {
        isLoading = useCase.notifyLoading()
        do {
            try await useCase.execute(type: .google)
            isLoading = useCase.stopLoading()
        } catch {
            isError = true
            isLoading = useCase.stopLoading()
            errorMessage = error.localizedDescription
        }
    }
    
    func appleLogin() async {
        isLoading = useCase.notifyLoading()
        do {
            try await useCase.execute(type: .apple)
            isLoading = useCase.stopLoading()
        } catch {
            isError = true
            isLoading = useCase.stopLoading()
            errorMessage = error.localizedDescription
        }
    }
}
