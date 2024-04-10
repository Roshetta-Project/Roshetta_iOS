//
//  ContactUsView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 11/04/2024.
//

import SwiftUI

struct ContactUsView: View {
    @State private  var isLoading = false
    var body: some View {
        VStack(alignment: .leading,spacing: 10){
            Text("Get In Touch!")
                .font(.custom(GFFonts.SeguiBold, size: 24))
                .foregroundColor(Colors.main)
            
            VStack(alignment:.leading,spacing: 8){
                Text("Name")
                    .font(.custom(GFFonts.Segui, size: 18))
                CustomTextField()
            }
            
            VStack(alignment:.leading,spacing: 8){
                Text("E-mail")
                    .font(.custom(GFFonts.Segui, size: 18))
                CustomTextField()

            }          
            
            VStack(alignment:.leading,spacing: 8){
                Text("Message")
                    .font(.custom(GFFonts.Segui, size: 18))
                MessageTextField()

            }
            

        }
        
        .padding()
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
    ContactUsView()
}
