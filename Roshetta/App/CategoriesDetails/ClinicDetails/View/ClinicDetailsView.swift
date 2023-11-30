//
//  ClinicDetailsView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 30/11/2023.
//

import SwiftUI

struct ClinicDetailsView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 4){
                    Image("clinc")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 160, height: 160)
                        .clipShape(Ellipse())
                        .overlay(
                            Ellipse()
                                .stroke(Color("main"), lineWidth: 1)
                        )
                        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4)

                    HStack(spacing: 0){
                        Text("The Care ")
                            .foregroundColor(Color("text"))
                            .font(.custom(GFFonts.popinsSemiBold, size: 20))

                        Text("Clinic ")
                            .foregroundColor(Color("text").opacity(0.6))
                            .font(.custom(GFFonts.popinsMedium, size: 20))

                    }//:HStack
                    .font(.custom(GFFonts.popinsSemiBold, size: 20))
                HStack {
                    ForEach(0 ..< 5) { index in
                        Image(systemName: index < 3 ? "star.fill" : "star")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width:15,height: 15)
                    }
                } //HStack
                    
                    
                    
                    
                    
                    
                    
                }//:VStack
            }//:ScrollView
        }//:NavigationStack
    }
}

struct ClinicDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ClinicDetailsView()
    }
}
