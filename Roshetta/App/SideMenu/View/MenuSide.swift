//
//  MenuSide.swift
//  Roshetta
//
//  Created by Sami Ahmed on 23/03/2024.
//

import SwiftUI

struct MenuSide: View {
    // MARK: - PROPERTYS
    @Binding var selectedTab : String
    var animation: Namespace.ID
    @Binding var showMenue: Bool
    @AppStorage("isLogin") var isLogin: Bool = false

    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.medium) {
            // MARK: - Profile Image
            Circle()
                .stroke(Color.white, lineWidth: 3)
                .frame(width: 80, height: 80)
                .overlay(
                    Image("user")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                )
                .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                .padding(.top, Spacing.xxxLarge)
            
            // MARK: - User Profile Info
            VStack(alignment: .leading, spacing: Spacing.small) {
                Text("Hi Sami Ahmed")
                    .font(Typography.title3)
                    .foregroundColor(.white)
                
                Text("samiahmed2@gmail.com")
                    .font(Typography.title2)
                    .foregroundColor(Color.white.opacity(0.8))
            }
            
            // MARK: - Menu Items
            VStack {
                VStack(alignment: .leading, spacing: Spacing.small) {
                    
                    TabButton(image: "person", title: "Profile", selectedTab: $selectedTab, animation: animation)
                    
                    TabButton(image: "house", title: "Home", selectedTab: $selectedTab, animation: animation)
                    
                    TabButton(image: "calendar", title: "Reservation", selectedTab: $selectedTab, animation: animation)
                    
                    TabButton(image: "qrcode.viewfinder", title: "Scanner", selectedTab: $selectedTab, animation: animation)
                    
                    TabButton(image: "bookmark.fill", title: "Saved", selectedTab: $selectedTab, animation: animation)
                }
                .padding(.leading, -20)
                .padding(.top, Spacing.xxxLarge)
                
                Spacer()
            }
            
            // MARK: - Logout Button
            Button(action: {
                print("Logging out")
                isLogin = false
            }, label: {
                HStack(spacing: Spacing.medium) {
                    Image(systemName: "iphone.and.arrow.forward")
                        .font(.title2)
                        .frame(width: 30)
                        .foregroundColor(.white)
                    
                    Text("Logout")
                        .font(Typography.callout)
                        .foregroundColor(.white)
                }
                .foregroundColor(.white)
                .padding(.vertical, Spacing.mediumSmall)
                .padding(.horizontal, Spacing.medium)
            })

        }
        .overlay {
            // MARK: - Close Button
            Button {
                showMenue.toggle()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .padding(Spacing.medium)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
    
}


//#Preview {
//    /*MenuSide*/()
//}
