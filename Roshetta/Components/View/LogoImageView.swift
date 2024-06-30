//
//  LogoImageView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 04/12/2023.
//

import SwiftUI
struct LogoImageView: View {
    let image : String
    var body: some View {
        
        AsyncImage(url: image.asUrl) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 128, height: 128)
                    .clipShape(Ellipse())
                    .overlay(
                        Ellipse()
                            .stroke(Colors.main, lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4)
            case .failure(let error):
                Image("user")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 128, height: 128)
                    .clipShape(Ellipse())
                    .overlay(
                        Ellipse()
                            .stroke(Colors.main, lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4)
            @unknown default:
                Image("user")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 128, height: 128)
                    .clipShape(Ellipse())
                    .overlay(
                        Ellipse()
                            .stroke(Colors.main, lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4)
            }
        }
        
    }
}

struct LogoImageView_Previews: PreviewProvider {
    static var previews: some View {
        LogoImageView(image: "clinc")
    }
}
