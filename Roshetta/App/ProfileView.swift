//
//  ProfileView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 31/03/2024.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - PROPERTYS
    let userName : String
    let location : String
    
    // MARK: - VIEW
    var body: some View {
        
        //Header
        ScrollView{
            VStack(alignment:.center,spacing: 8){
                ProfileImage()
                Text(userName)
                    .font(.custom(GFFonts.SeguiBold, size: 24))
                
                HStack{
                    Image("Location")
                    Text(location)
                        .font(.custom(GFFonts.Segui, size: 16))
                        .foregroundColor(.gray)
                    
                }
                ProfileVieww()
                    .padding()
            }

        }
        Spacer()
        
    }
}

#Preview {
    ProfileView(userName: "Sami Ahmed", location: "Damietta,Egypt")
}
