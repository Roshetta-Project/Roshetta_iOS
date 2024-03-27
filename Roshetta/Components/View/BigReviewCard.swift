//
//  BigReviewCard.swift
//  Roshetta
//
//  Created by Sami Ahmed on 27/03/2024.
//

import SwiftUI

struct BigReviewCard: View {
    // MARK: - PROPERTYS
    let userName : String
    let description: String
    let rate: Int
    let date : String
    // MARK: - VIEW
    var body: some View {
        VStack(alignment: .leading, spacing : 8){
            HStack(spacing: 5){
                Text(userName)
                    .font(.custom(GFFonts.SeguiSemiBold, size: 14))
                    .foregroundColor(Color.black)

                HStack {
                  ForEach(0..<5) { index in
                    Image(systemName: index < rate ? "star.fill" : "star")
                      .resizable()
                      .foregroundColor(.yellow)
                      .frame(width: 12, height: 12)
                  }
                }//: RATING STARS
                Spacer()
            Text(date)
              .font(.custom(GFFonts.Segui, size: 10))
              .foregroundColor(Color.gray)


            }//HStack
            Text(description)
            .font(.custom(GFFonts.Segui, size: 12))
            .foregroundColor(Color.gray)
            
        }//VStack
        .padding(20)
        .background(Color.gray.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 8))

    }
}

#Preview {
    BigReviewCard(userName: "Abdalazem Saleh", description: "Great history!, I’m very happy and i will do it again", rate: 4, date: "1/1/2024")
}
