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
    
    // MARK: - Body
    var body: some View {
        ZStack {
            CircularGradient()
            
            VStack(alignment: .leading) {
                Text("Are you pregnant, breastfeed or nursing?")
                    .font(.custom(GFFonts.SeguiSemiBold, size: 24))
                    .padding(.top, 50)
                Text("(Female)")
                    .font(.custom(GFFonts.Segui, size: 18))
                    .foregroundStyle(.gray)
                
                HStack{
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
                .padding(.horizontal,25)
                .font(.custom(GFFonts.Segui, size: 21))
                .foregroundStyle(.black)
                
                
                Spacer()
                // MARK: - Next Button
                VStack{
                    HStack{
                        Spacer()
                        Image(.homeVector)
                    }
                    
                    GFButton(isLoading: $isLoading, text: "Next", backgroundColor: Colors.main, foregroundColot: Color.white) {
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    PregnancyView()
}
