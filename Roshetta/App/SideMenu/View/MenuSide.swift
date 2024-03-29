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
    
    // MARK: - Body
    var body: some View {
        VStack(alignment:.leading,spacing: 15){
            Circle()
    .stroke(Color.white, lineWidth: 5)
    .frame(width: 70, height: 70) // Adjust size as needed
                          .overlay(
                              Image("user")
                                  .resizable()
                                  .aspectRatio(contentMode: .fill)
          .frame(width: 70, height: 70)
                                  .clipShape(Circle())
                          )
                          .padding(.top, 50) // Adjust top padding
            
            //Profile
            VStack(alignment:.leading,spacing: 8){
                Text("Hi Sami !")
                    .font(.custom(GFFonts.SeguiBold, size: 20))
                    .foregroundColor(.white)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("View Profile")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 16))
                        .foregroundColor(.black)
                        .opacity(0.4)
                })
            }
            
            VStack(alignment:.leading,spacing:10){
                TabButton(image: "bell.fill", title: "Notification", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "bookmark.fill", title: "Saved", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "qrcode.viewfinder", title: "Scanner", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "message.fill", title: "Chat", selectedTab: $selectedTab, animation: animation)
                
                TabButton(image: "gearshape.fill", title: "Setting", selectedTab: $selectedTab, animation: animation)
            }
            .padding(.leading,-20)
            .padding(.top,50)
            
            Spacer()
            
            //SignOut
            TabButton(image: "iphone.and.arrow.forward", title: "Logout", selectedTab: .constant(""), animation: animation)
                .padding(.leading,-20)
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
    }
}

#Preview {
    SideMenuView()
}
