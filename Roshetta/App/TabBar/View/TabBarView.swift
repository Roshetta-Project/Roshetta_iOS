//
//  TabBarView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 31/03/2024.
//

import SwiftUI

struct TabBarView: View {
    
    // PROPERTYS
    
    @State private var selectedTab = 0
    
    // VIEW
    
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
                        Image(systemName: "rectangle.grid.3x2.fill")
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

#Preview {
    TabBarView()
}
