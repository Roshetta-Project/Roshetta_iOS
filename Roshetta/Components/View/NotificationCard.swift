//
//  NotificationCard.swift
//  Roshetta
//
//  Created by Sami Ahmed on 27/03/2024.
//

import SwiftUI

struct NotificationCard: View {
    // MARK: - PROPERTIES
    let image: Image
    let alert: String
    let description: String
    
    // MARK: - VIEW
    var body: some View {
        HStack{
            image
              .resizable()
              .modifier(RoundedImage(size: 64))
              .shadow(color: Color.gray.opacity(0.1), radius: 4, x: 2, y: 2)
            
            VStack(alignment:.leading){
                Text(alert)
                    .font(.custom(GFFonts.SeguiSemiBold, size: 20))
                    .foregroundColor(Color.black)
                
                Text(description)
                    .font(.custom(GFFonts.Segui, size: 12))
                    .foregroundColor(Color.gray)
                
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    NotificationCard(image: Image("clinc"), alert: "Remember !", description: "You have an appointment with Mrs. Shrouk Ahmed at 03:00 pm, Tomorrow.")
}
