//
//  Home.swift
//  Roshetta
//
//  Created by Sami Ahmed on 23/03/2024.
//

import SwiftUI

struct Home: View {
    @Binding var selectedTab : String
    
    init(selectedTab:Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection:$selectedTab){
            
           //views
            HomeView()
                .tag("Home")
                .padding(.top,45)
            
            ReservationVIew()
                .tag("Reservation")
                .padding(.top,45)

            NotificationsView()
                .tag("Notification")
                .padding(.top,45)
            
            NotificationsView() //Replace with savedView
                .tag("Saved")
                .padding(.top,45)  
            
            NotificationsView() //Replace with Scanner
                .tag("Scanner")
                .padding(.top,45)
            
            NotificationsView() //Replace with Setting
                .tag("Setting")
                .padding(.top,45)
            
          


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
