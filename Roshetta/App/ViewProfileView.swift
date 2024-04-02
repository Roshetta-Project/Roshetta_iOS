//
//  ViewProfileView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 02/04/2024.
//

import SwiftUI

struct ViewProfileView: View {
    @State private  var isLoading = false

    var body: some View {
        VStack(){
            ProfileImageView(image: "person.fill")
                .padding(.top,40)
            VStack(alignment:.leading,spacing: 8){
                Text("Name")
                    .font(.custom(GFFonts.Segui, size: 18))
                CustomProfileTextField(placeholder: "Sami Ahmed")
            }
            
            VStack(alignment:.leading,spacing: 8){
                Text("E-mail")
                    .font(.custom(GFFonts.Segui, size: 18))
                CustomProfileTextField(placeholder: "SamiAhmed8@gmail.com")
            }
            
            VStack(alignment:.leading,spacing: 8){
                Text("Phone number")
                    .font(.custom(GFFonts.Segui, size: 18))
                CustomProfileTextField(placeholder: "01094111832")
            }
        }
        .padding()
        Spacer()
        
        GFButton(isLoading: $isLoading, text: "Next", backgroundColor: Colors.main, foregroundColot: Color.white) {
            print("Next button tapped")
            // Add your action here
        }
        .padding()
        .padding(.bottom,40)
        
        
    }
}

#Preview {
    ViewProfileView()
}
