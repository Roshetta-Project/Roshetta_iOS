//
//  AuthViewModelProtocol.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-22.
//

import Foundation

protocol AuthViewModelProtocol {
    func facebookLogin() async
    func googleLogin() async
    func appleLogin() async
}
