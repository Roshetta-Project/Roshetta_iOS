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
    @AppStorage("isLogin") var isLogin: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            CircularGradient()
            
            VStack(alignment: .leading) {
                Text("Are you smoking?")
                    .font(Typography.title2)
                    .padding(.top, Spacing.xxxLarge)
                
                HStack{
                    Button(action: {
                        smoking = true
                    }) {
                        Image(systemName: smoking ? "checkmark.square" : "square")
                        Text("Yes")
                    }
                    .foregroundColor(smoking ? Colors.main : Colors.secondaryLabel)
                    
                    Spacer()
                    
                    Button(action: {
                        smoking = false
                    }) {
                        Image(systemName: smoking ? "square" : "checkmark.square")
                        Text("No")
                    }
                    .foregroundColor(smoking ? Colors.secondaryLabel : Colors.main)
                }
                .padding(Spacing.xSmall)
                .padding(.horizontal, Spacing.large)
                .font(Typography.title3)
                .foregroundStyle(.black)
                
                
                Spacer()
                // MARK: - Next Button
                    GFButton(isLoading: $isLoading, text: "Next", backgroundColor: Colors.main, foregroundColot: Color.white) {
                        isLogin = true
                    }
                
            }
            .padding(Spacing.medium)
        }
    }
}

#Preview {
    SmokingView()
}
