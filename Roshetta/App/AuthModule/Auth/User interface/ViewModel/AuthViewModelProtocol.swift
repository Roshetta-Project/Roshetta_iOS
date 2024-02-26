//
//  AuthViewModelProtocol.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-22.
//

import Foundation

protocol AuthViewModelProtocol {
    var isError: Bool { get set }
    var isLoading: Bool { get set }
    var errorMessage: String { get set }
    func facebookLogin() async
    func googleLogin() async
    func appleLogin() async
}
