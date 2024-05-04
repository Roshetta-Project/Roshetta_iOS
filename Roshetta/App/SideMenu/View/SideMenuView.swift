//
//  SideMenuView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 23/03/2024.
//

import SwiftUI

struct SideMenuView: View {
    // MARK: - PROPERTYS
    
    @State  var selectedTab = "Home"
    @State var showMenu = false
    @Namespace var animation
    
    // MARK: - Body
    var body: some View {
        ZStack{
            Colors.MenuBar
                .ignoresSafeArea()
            //menuside
            MenuSide(selectedTab: $selectedTab, animation: animation)
            
            ZStack{
                //two bkg cards
                Color.white
                    .opacity(0.5)
                    .cornerRadius(showMenu ? 15 : 0)
                //shadow
                    .shadow(color: .black.opacity(0.07), radius: 5)
                    .offset(x: showMenu ? -25 : 0)
                    .padding(.vertical,30)
                
                Color.white
                    .opacity(0.5)
                    .cornerRadius(showMenu ? 15 : 0)
                //shadow
                    .shadow(color: .black.opacity(0.07), radius: 5)
                    .offset(x: showMenu ? -50 : 0)
                    .padding(.vertical,60)
                
                
                Home(selectedTab: $selectedTab)
                    .cornerRadius(showMenu ? 15 : 0)
            }
            //scalling and moving
            .scaleEffect(showMenu ?  0.84 : 1 )
            .offset(x: showMenu ? UIScreen.main.bounds.width - 120 : 0)
            .ignoresSafeArea()
            .overlay(
                Button(action: {
                    withAnimation(.spring()){
                        showMenu.toggle()
                    }
                }, label: {
                    
                    VStack(spacing:5){
                        Capsule()
                            .fill(showMenu ? Color.white : Colors.main)
                            .frame(width: 30,height: 3)
                        //rotating
                            .rotationEffect(.init(degrees: showMenu ? -50 : 0))
                            .offset(x: showMenu ? 2 : 0 ,y: showMenu ? 9: 0)
                        VStack(spacing:5){
                            Capsule()
                                .fill(showMenu ? Color.white : Colors.main)
                                .frame(width: 30,height: 3)
                            
                            //moving up when clicked
                            Capsule()
                                .fill(showMenu ? Color.white : Colors.main)
                                .frame(width: 30,height: 3)
                                .offset(y:showMenu ? -8 : 0)
                        }
                        .rotationEffect(.init(degrees: showMenu ? 50 : 0))
                        
                    }                        })
                .padding()
                ,alignment: .topLeading
                
            )
        }
    }
}

#Preview {
    SideMenuView()
}
