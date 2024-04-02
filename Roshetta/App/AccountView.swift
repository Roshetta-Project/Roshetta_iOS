//
//  AccountView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 02/04/2024.
//

import SwiftUI

struct AccountView: View {
    // MARK: - PROPERTYS
 
    let sections = [
        ProfileSectionItem(title: "View Profile", imageName: ""),
        ProfileSectionItem(title: "Data History", imageName: "")
    ]
    
    var body: some View {
        List {
            ForEach(sections) { section in
                NavigationLink(destination: ViewProfileView()) {
                    ProfileViewSections(section: section)
                }
                .navigationTitle("Account")
                .navigationBarTitleDisplayMode(.inline)
            }
            .listRowBackground(Color.gray.opacity(0.1))
        }
        .listStyle(.plain)
        .cornerRadius(16)
        .padding()
    }
}

#Preview {
    AccountView()
}
