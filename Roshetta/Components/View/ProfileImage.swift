//
//  ProfileImage.swift
//  Roshetta
//
//  Created by Sami Ahmed on 31/03/2024.
//

import SwiftUI

struct ProfileImage: View {
    var body: some View {
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: Dimensions.avatarXLarge, height: Dimensions.avatarXLarge)
          .background(
            Image("user")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: Dimensions.avatarXLarge, height: Dimensions.avatarXLarge)
              .clipped()
          )
          .background(Color(red: 0.85, green: 0.85, blue: 0.85))
          .cornerRadius(Dimensions.avatarXLarge)
          .shadow(color: Colors.primaryLabel.opacity(Dimensions.shadowOpacity), radius: Dimensions.shadowRadius, x: Dimensions.shadowX, y: Dimensions.shadowY)
          .overlay(
            RoundedRectangle(cornerRadius: Dimensions.avatarXLarge)
              .inset(by: 0.5)
              .stroke(Color(red: 0.44, green: 0.76, blue: 0.97), lineWidth: 1)
          )    }
}

#Preview {
    ProfileImage()
}
