//
//  AuthModuleFactory.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-04.
//

import SwiftUI

protocol AuthModuleFactoryProtocol {
    func makeView() -> any View
}

final class  AuthModuleFactory { }

extension AuthModuleFactory: AuthModuleFactoryProtocol {
    func makeView() -> any View {
        return Text("Hell")
    }
}
