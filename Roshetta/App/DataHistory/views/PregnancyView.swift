//
//  PregnancyView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 01/04/2024.
//

import SwiftUI


struct PregnancyView: View {
    // MARK: - Properties
    @State private var isLoading = false
    @State private var pregnancy = false
    @State private var shouldNavigate = false // New state for navigation
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                CircularGradient()
                
                VStack(alignment: .leading) {
                    Text("Are you pregnant, breastfeeding, or nursing?")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 24))
                        .padding(.top, 50)
                    
                    Text("(Female)")
                        .font(.custom(GFFonts.Segui, size: 18))
                        .foregroundColor(.gray)
                    
                    HStack {
                        Button(action: {
                            pregnancy = true
                        }) {
                            Image(systemName: pregnancy ? "checkmark.square" : "square")
                            Text("Yes")
                        }
                        .foregroundColor(pregnancy ? Colors.main : .gray)
                        
                        Spacer()
                        
                        Button(action: {
                            pregnancy = false
                        }) {
                            Image(systemName: pregnancy ? "square" : "checkmark.square")
                            Text("No")
                        }
                        .foregroundColor(pregnancy ? .gray : Colors.main)
                    }
                    .padding(5)
                    .padding(.horizontal, 25)
                    .font(.custom(GFFonts.Segui, size: 21))
                    .foregroundColor(.black)
                    
                    Spacer()
                    
                    // MARK: - Next Button
                    NavigationLink(destination: SmokingView(), isActive: $shouldNavigate) {
                        GFButton(isLoading: $isLoading, text: "Next", backgroundColor: Colors.main, foregroundColot: .white) {
                            // Action when Next button is tapped
                            shouldNavigate = true
                        }
                    }
                    .padding()
                }
                .padding()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}



struct PregnancyView_Previews: PreviewProvider {
    static var previews: some View {
        PregnancyView()
    }
}
