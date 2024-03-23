//
//  Home.swift
//  Roshetta
//
//  Created by Sami Ahmed on 23/03/2024.
//

import SwiftUI

struct Home: View {
    @Binding var selectedTab : String
    var body: some View {
        TabView(selection:$selectedTab){
            
           //views
            Notifications()
                .tag("Notifications")
            
            DoctorDetailsView()
                .tag("Saved")
            Scanner()
                .tag("Scanner")
            chat()
                .tag("chat")
            setting()
                .tag("setting")
        }
    }
}

#Preview {
    SideMenuView()
}

struct Notifications: View {
    var body: some View {
        NavigationView{
            VStack{
                Image("user")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 50,height: 400)
                    .cornerRadius(15)
                Text("Welcome  Sami")
                    .font(.custom(GFFonts.SeguiBold, size: 30))
                    .foregroundColor(Colors.main)
                Text("iOS Developer")
                    .font(.custom(GFFonts.SeguiSemiBold, size: 24))
                    .foregroundColor(Color.black)
                
            }
        }
    }
}

struct Saved: View {
    var body: some View {
        NavigationView{
            Text("Saved")
                .foregroundColor(.black)
                .navigationTitle("Saved")
        }
    }
}

struct Scanner: View {
    var body: some View {
        NavigationView{
            Text("Scanner")
                .foregroundColor(.black)
                .navigationTitle("Scanner")
        }
    }
}

struct chat: View {
    var body: some View {
        NavigationView{
            Text("chat")
                .foregroundColor(.black)
                .navigationTitle("chat")
        }
    }
}

struct setting: View {
    var body: some View {
        NavigationView{
            Text("setting")
                .foregroundColor(.black)
                .navigationTitle("setting")
        }
    }
}
