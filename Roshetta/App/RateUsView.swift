//
//  RateUsView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 04/04/2024.
//

import SwiftUI

struct RateUsView: View {
    @State private  var isLoading = false
    var body: some View {
        VStack(alignment:.leading,spacing: 20){
            Text("WRITE A REVIEW")
                .font(.custom(GFFonts.SeguiBold, size: 20))
                .foregroundColor(Colors.main)
                .frame(maxWidth: .infinity, alignment: .center)
            
            VStack(alignment:.leading){
                Text("Score:")
                    .font(.custom(GFFonts.SeguiSemiBold, size: 16))
                StarRatingView()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            
            VStack(alignment:.leading){
                Text("Review:")
                    .font(.custom(GFFonts.SeguiSemiBold, size: 16))
                ReviewTextField()
                
            }
            
            
        }
        .padding()
        

        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.1)) // Gray background with opacity
        )
        .padding()
        .padding(.top,50)
        .cornerRadius(8)
        Spacer()
        GFButton(isLoading: $isLoading, text: "Next", backgroundColor: Colors.main, foregroundColot: Color.white) {
            print("Next button tapped")
            // Add your action here
        }
        .padding()
        .padding(.bottom,50)
    }
    
    
}

#Preview {
    RateUsView()
}
