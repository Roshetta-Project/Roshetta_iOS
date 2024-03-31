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
          .frame(width: 136, height: 136)
          .background(
            Image("user")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 136, height: 136)
              .clipped()
          )
          .background(Color(red: 0.85, green: 0.85, blue: 0.85))
          .cornerRadius(136)
          .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 2)
          .overlay(
            RoundedRectangle(cornerRadius: 136)
              .inset(by: 0.5)
              .stroke(Color(red: 0.44, green: 0.76, blue: 0.97), lineWidth: 1)
          )    }
}

#Preview {
    ProfileImage()
}
