//
//  Home.swift
//  Roshetta
//
//  Created by Sami Ahmed on 23/03/2024.
//

import SwiftUI

struct Home: View {
    @Binding var selectedTab : String
    @State var currentTab = "Home"
    
    init(selectedTab:Binding<String>) {
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationView{
                VStack(spacing:0){
                    TabView(selection:$selectedTab){
                        //views
                        HomeView()
                            .tag("Home")
                            .padding(.top,45)
                        
                        ProfileView(userName: "Sami Ahmed", location: "Damietta,Egypt")
                            .tag("Profile")
                            .padding(.top,45)
                        
                        ReservationVIew()
                            .tag("Reservation")
                            .padding(.top,45)
                        
                        rayScannerView(image:"ray")
                            .tag("Scanner")
                            .padding(.top,45)
                        
                            NotificationsView() //Replace with savedView
                                .tag("Saved")
                                .padding(.top,45)
                            

                            
                            NotificationsView() //Replace with Setting
                                .tag("Setting")
                                .padding(.top,45)
                        
                        
                    }

            
                    
                    //Custom Tab Bar
                    HStack(spacing:140){
                        // Navigation to Sami page
                        NavigationLink(destination: HomeView()) {
                            TabButton(image:"home",text: "Home")
                        }
                        
                        // Navigation to Shmed page
                        NavigationLink(destination: ReservationVIew()) {
                            TabButton(image:"reservation",text: "reservation")
                        }
                    }
                }
            
            
        }.navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
    }
    @ViewBuilder
    func TabButton(image : String,text:String) ->some View{
        Button(action: {
            withAnimation{currentTab = image}
        },
               label: {
            VStack{
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25,height: 25)
                    .foregroundColor(currentTab == image ? Colors.main : .gray)
                
                Text(text)
                    .font(.custom(GFFonts.SeguiBold, size: 12))
                    .foregroundColor(currentTab == image ? Colors.main : .gray)
                
            }
            
        })
        
    }
    
}

#Preview {
    SideMenuView()
}





