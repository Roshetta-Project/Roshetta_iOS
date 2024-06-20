//
//  SmokingView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 01/04/2024.
//

import SwiftUI

struct SmokingView: View {
    // MARK: - Properties
    @State private var isLoading = false
    @State private var smoking = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            CircularGradient()
            
            VStack(alignment: .leading) {
                Text("Are you smoking?")
                    .font(.custom(GFFonts.SeguiSemiBold, size: 24))
                    .padding(.top, 50)
                
                HStack{
                    Button(action: {
                        smoking = true
                    }) {
                        Image(systemName: smoking ? "checkmark.square" : "square")
                        Text("Yes")
                    }
                    .foregroundColor(smoking ? Colors.main : .gray)
                    
                    Spacer()
                    
                    Button(action: {
                        smoking = false
                    }) {
                        Image(systemName: smoking ? "square" : "checkmark.square")
                        Text("No")
                    }
                    .foregroundColor(smoking ? .gray : Colors.main)
                }
                .padding(5)
                .padding(.horizontal,25)
                .font(.custom(GFFonts.Segui, size: 21))
                .foregroundStyle(.black)
                
                
                Spacer()
                // MARK: - Next Button
                    GFButton(isLoading: $isLoading, text: "Next", backgroundColor: Colors.main, foregroundColot: Color.white) {
                    }
                
            }
            .padding()
        }
    }
}

#Preview {
    SmokingView()
}
