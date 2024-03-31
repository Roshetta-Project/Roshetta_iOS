//
//  ProfileViewSections.swift
//  Roshetta
//
//  Created by Sami Ahmed on 31/03/2024.
//

import SwiftUI

struct ProfileSectionItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
}

struct ProfileViewSections: View {
    
    let section: ProfileSectionItem
    
    var body: some View {
        HStack (spacing:10){
            Image(section.imageName)
            Text(section.title)
                .font(.custom(GFFonts.SeguiSemiBold, size: 16))
            Spacer()
        }
        .padding()
    }
}

struct ProfileVieww: View {
    
    let sections = [
        ProfileSectionItem(title: "Account", imageName: "contactus"),
        ProfileSectionItem(title: "Privacy Policy", imageName: "lock icon"),
        ProfileSectionItem(title: "Rate Us", imageName: "star icon"),
        ProfileSectionItem(title: "About Us", imageName: "users icon"),
        ProfileSectionItem(title: "Contact Us", imageName: "contactus")
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(sections) { section in
                    NavigationLink(destination: HomeView()) {
                        ProfileViewSections(section: section)
                    }
                }
                .listRowBackground(Color.gray.opacity(0.1))
            }
            .listStyle(.plain)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileVieww()
    }
}
