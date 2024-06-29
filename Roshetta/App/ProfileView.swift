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
    var buttonAction: () -> Void
    
    
    let sections = [
        ProfileSectionItem(title: "Account", imageName: "contactus"),
        ProfileSectionItem(title: "Privacy Policy", imageName: "lock icon"),
        ProfileSectionItem(title: "Rate Us", imageName: "star icon"),
        ProfileSectionItem(title: "About Us", imageName: "users icon"),
        ProfileSectionItem(title: "Contact Us", imageName: "contactus")
    ]
    
    // MARK: - VIEW
    
    var body: some View {
        NavigationView {
            
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
                
                ProfileVieww()
                    .padding()
            }
            .navigationBarItems(
                leading:
                    Button {
                       buttonAction()
                    } label: {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(.gray)
                    },
                trailing:
                    NavigationLink(destination: SearchBar()) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                    }
            )
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

#Preview {
    ProfileView(userName: "Sami Ahmed", location: "Damietta,Egypt", buttonAction: {})
}
