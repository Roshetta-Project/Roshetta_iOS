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
    var buttonAction: () -> Void
    
    init(selectedTab:Binding<String>, buttonAction: @escaping () -> Void) {
        self.buttonAction = buttonAction
        self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing:0) {
            TabView(selection:$selectedTab){
                //views
                HomeView(buttonAction: {buttonAction()})
                    .tag("Home")
                
                ProfileView(userName: "Sami Ahmed", location: "Damietta,Egypt", buttonAction: {buttonAction()})
                    .tag("Profile")
                
                ReservationVIew(buttonAction: {buttonAction()})
                    .tag("Reservation")
                
                rayScannerView(image:"ray", buttonAction: {buttonAction()})
                    .tag("Scanner")
                
                NotificationsView(buttonAction: {buttonAction()}) //Replace with savedView
                    .tag("Saved")
                
                ClinicListView() //Replace with Setting
                    .tag("Setting")
                
            }
        }
    }
    //    @ViewBuilder
    //    func TabButton(image : String,text:String) ->some View{
    //        Button(action: {
    //            withAnimation{currentTab = image}
    //        },
    //               label: {
    //            VStack{
    //                Image(image)
    //                    .resizable()
    //                    .renderingMode(.template)
    //                    .aspectRatio(contentMode: .fit)
    //                    .frame(width: 25,height: 25)
    //                    .foregroundColor(currentTab == image ? Colors.main : .gray)
    //
    //                Text(text)
    //                    .font(.custom(GFFonts.SeguiBold, size: 12))
    //                    .foregroundColor(currentTab == image ? Colors.main : .gray)
    //
    //            }
    //
    //        })
    //
    //    }
    
}

#Preview {
    Home(selectedTab: .constant(""), buttonAction: { })
}





