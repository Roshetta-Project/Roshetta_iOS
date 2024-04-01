//
//  AddressView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 01/04/2024.
//

import SwiftUI

struct AddressView: View {
    @State private  var isLoading = false

    var body: some View {
        ZStack{
            CircularGradient()
            ScrollView{
                VStack(alignment: .leading, spacing:10){
                    VStack{
                        Text("Enter your Address!")
                            .font(.custom(GFFonts.SeguiSemiBold, size: 24))
                            .padding(.top, 20)
                    }
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text("Street")
                            .font(.custom(GFFonts.Segui, size: 18))
                        CustomTextField()
                    }
                   
                    VStack(alignment: .leading){
                        Text("City")
                            .font(.custom(GFFonts.Segui, size: 18))
                        CustomPicker()
                    }
                
                    VStack(alignment: .leading){
                        Text("Street")
                            .font(.custom(GFFonts.Segui, size: 18))
                        CustomPicker()
                    }
                    
                    VStack(alignment: .leading){
                        Text("ZIP")
                            .font(.custom(GFFonts.Segui, size: 18))
                        CustomTextField()
                    }
                    Spacer()
                    
                    VStack{
                        HStack{
                            Spacer()
                            Image(.homeVector)
                        }
                        
                        GFButton(isLoading: $isLoading, text: "Next", backgroundColor: Colors.main, foregroundColot: Color.white) {
                            print("Next button tapped")
                            // Add your action here
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    AddressView()
}
