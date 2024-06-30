//
//  AddressView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 01/04/2024.
//

import SwiftUI


import SwiftUI

struct AddressView: View {
    // MARK: - PROPERTIES
    @State private var isLoading = false
    @State private var shouldNavigate = false
    
    // MARK: - VIEW
    var body: some View {
        NavigationView {
            ZStack {
                CircularGradient()
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Enter your Address!")
                            .font(.custom(GFFonts.SeguiSemiBold, size: 24))
                            .padding(.top, 20)
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            Text("Street")
                                .font(.custom(GFFonts.Segui, size: 18))
                            CustomTextField()
                        }
                        
                        VStack(alignment: .leading) {
                            Text("City")
                                .font(.custom(GFFonts.Segui, size: 18))
                            CustomTextField()
                        }
                        
                        VStack(alignment: .leading) {
                            Text("State")
                                .font(.custom(GFFonts.Segui, size: 18))
                            CustomTextField()
                        }
                        
                        VStack(alignment: .leading) {
                            Text("ZIP")
                                .font(.custom(GFFonts.Segui, size: 18))
                            CustomTextField()
                        }
                        
                        Spacer()
                        
                        VStack {
                            HStack {
                                Spacer()
                                Image("homeVector")
                            }
                            
                            GFButton(isLoading: $isLoading, text: "Next", backgroundColor: Colors.main, foregroundColot: Color.white) {
                                print("Next button tapped")
                                shouldNavigate = true
                            }
                        }
                    }
                    .padding()
                    
                    // Navigation Link
                    NavigationLink(destination: ExerciseView().navigationBarBackButtonHidden(true), isActive: $shouldNavigate) {
                        EmptyView()
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle()) // Ensure correct display on all devices
        }
    }
}



#Preview {
    AddressView()
}
