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
            
            VStack(alignment:.center,spacing: Spacing.small){
                ProfileImage()
                Text(userName)
                    .font(Typography.title2)
                
                HStack{
                    Image("Location")
                    Text(location)
                        .font(Typography.callout)
                        .foregroundColor(Colors.secondaryLabel)
                    
                }
                
                List {
                               ForEach(sections) { section in
                                   NavigationLink(destination: destinationForSection(section)) {
                                       ProfileViewSections(section: section)
                                   }
                               }
                               .listRowBackground(Colors.surface.opacity(0.5))
                }
                .listStyle(.plain)
                .padding(Spacing.medium)
            }
            .navigationBarItems(
                leading:
                    Button {
                       buttonAction()
                    } label: {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(Colors.secondaryLabel)
                    },
                trailing:
                    NavigationLink(destination: SearchBar()) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Colors.secondaryLabel)
                    }
            )
            .navigationBarTitle("", displayMode: .inline)
        }
    }
    
    private func destinationForSection(_ section: ProfileSectionItem) -> some View {
            switch section.title {
            case "Account":
                return AnyView(AccountView()) // Replace AccountView() with your desired account view
            case "Privacy Policy":
                return AnyView(PrivacyPolicyView()) // Replace PrivacyPolicyView() with your desired privacy policy view
            case "Rate Us":
                return AnyView(RateUsView()) // Replace RateUsView() with your desired rate us view
            case "About Us":
                return AnyView(AboutUsView()) // Replace AboutUsView() with your desired about us view
            case "Contact Us":
                return AnyView(ContactUsView()) // Replace ContactUsView() with your desired contact us view
            default:
                return AnyView(EmptyView())
            }
        }
}



#Preview {
    ProfileView(userName: "Sami Ahmed", location: "Damietta,Egypt", buttonAction: {})
}
