//
//  ProfileView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 31/03/2024.
//

import SwiftUI

struct ProfileView: View {
    
    // MARK: - PROPERTYS
    
    let userName : String
    let location : String
    
    let sections = [
        ProfileSectionItem(title: "Account", imageName: "contactus"),
        ProfileSectionItem(title: "Privacy Policy", imageName: "lock icon"),
        ProfileSectionItem(title: "Rate Us", imageName: "star icon"),
        ProfileSectionItem(title: "About Us", imageName: "users icon"),
        ProfileSectionItem(title: "Contact Us", imageName: "contactus")
    ]
    
    
    // MARK: - VIEW
    
    var body: some View {
        NavigationStack {
            
            VStack(alignment:.center,spacing: 8){
                ProfileImage()
                Text(userName)
                    .font(.custom(GFFonts.SeguiBold, size: 24))
                
                HStack{
                    Image("Location")
                    Text(location)
                        .font(.custom(GFFonts.Segui, size: 16))
                        .foregroundColor(.gray)
                    
                }
                
                List {
                    ForEach(sections) { section in
                        NavigationLink(destination: HomeView()) {
                            ProfileViewSections(section: section)
                        }
                    }
                    .listRowBackground(Color.gray.opacity(0.1))
                }
                .listStyle(.plain)
                .cornerRadius(16)
                .padding()
            }
            
        }
        .padding(.top, 32)
    }
}

#Preview {
    ProfileView(userName: "Sami Ahmed", location: "Damietta,Egypt")
}
