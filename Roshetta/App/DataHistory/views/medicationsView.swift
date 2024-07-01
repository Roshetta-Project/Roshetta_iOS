//
//  medicationsView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 01/07/2024.
//

import SwiftUI

struct medicationsView: View {
    @State private var text: String = ""
    @State private var isLoading = false
    @State private var shouldNavigate = false
    
    var body: some View {
        NavigationView {
            ZStack {
                CircularGradient()
                
                VStack {
                    Text("If you take medications, What are they?")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 20))
                        .padding(.top, 50)
                    
                    Spacer()
                    
                    TextField("Enter ", text: $text)
                        .padding()
                        .frame(width: 300,height: 400)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2)
                        .padding()
                    
                    Spacer()
                    
                    NavigationLink(destination: PregnancyView(), isActive: $shouldNavigate) {
                        GFButton(isLoading: $isLoading, text: "Next", backgroundColor: Colors.main, foregroundColot: Color.white) {
                            print("Next button tapped")
                            shouldNavigate = true
                        }
                        .padding()
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}



struct medicationsView_Previews: PreviewProvider {
    static var previews: some View {
        medicationsView()
    }
}
