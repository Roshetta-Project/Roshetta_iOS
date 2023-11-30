//
//  ReviewCard.swift
//  Roshetta
//
//  Created by Sami Ahmed on 30/11/2023.
//

import SwiftUI
struct ReviewCard: View {
    // MARK: - PROPERTYS
    let userName : String
    let description: String
    let review : String
    // MARK: - VIEW
    var body: some View {
        VStack(alignment: .leading, spacing : 3){
            HStack(spacing: 3){
                Text(userName)
                    .font(.custom(GFFonts.popinsSemiBold, size: 12))
                    .foregroundColor(Color("text"))
                Text(review)
                    .font(.custom(GFFonts.popinsMedium, size: 10))
                    .foregroundColor(Color("text").opacity(0.65))
                
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 10,height: 10)
                    .foregroundColor(.yellow)
            }//HStack
            
            Text(description)
            .font(.custom(GFFonts.popinsMedium, size: 8))
            .foregroundColor(Color("text").opacity(0.65))
            .frame(width: 70,height: 10)
        }//VStacck
        .padding(10)
        .background(Color.gray.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("main"), lineWidth: 1))
    }
}

struct ReviewCard_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCard(userName: "Sami Ahmed  ", description: "he is so bad and i dont relate it ", review: "3")
    }
}

