//
//  TabBarView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 31/03/2024.
//

import SwiftUI


struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                            .foregroundColor(selectedTab == 0 ? Colors.main : .gray)
                        
                        Text("Home")
                            .foregroundColor(selectedTab == 0 ? Colors.main : .gray)
                    }
                    .tag(0)
                
                NotificationsView()
                    .tabItem {
                        Image(systemName:"rectangle.grid.3x2.fill")
                            .foregroundColor(selectedTab == 1 ? Colors.main : .gray)
                        
                        Text("Reservations")
                            .foregroundColor(selectedTab == 1 ? Colors.main : .gray)
                    }
                    .tag(1)
            }
            .accentColor(Colors.main)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}



    struct HomeView: View {
        var body: some View {
            Text("Home Screen")
                .font(.title)
                .padding()
        }
    }

    struct ReservationsView: View {
        var body: some View {
            Text("Reservations Screen")
                .font(.title)
                .padding()
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


