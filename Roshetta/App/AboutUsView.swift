//
//  AboutUsView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 02/04/2024.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading,spacing: 10){
                Text("About Us")
                    .font(.custom(GFFonts.SeguiBold, size: 24))
                VStack(alignment: .leading, spacing:0){
                    Text("Who we are ?")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 18))
                        .foregroundColor(Colors.main)
                    
                    Text("- Roshetta is a mobile app that has transformed the way people approach medical appointments. It offers a seamless and convenient platform for both online and offline doctor appointments, as well as cutting-edge AI features.")
                        .font(.custom(GFFonts.Segui, size: 18))
                        .foregroundColor(.gray)
                }
                
                VStack(alignment: .leading, spacing:0){
                    Text("Our vision !")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 18))
                        .foregroundColor(Colors.main)
                    
                    Text("- Our vision is to create a user-friendly mobile app that simplifies and enhances the process of booking doctor appointments. By providing a seamless platform, we aim to empower users to easily schedule, manage, and access healthcare services, fostering a convenient and efficient healthcare experience for both patients and healthcare providers.")
                        .font(.custom(GFFonts.Segui, size: 18))
                        .foregroundColor(.gray)
                }
                
                VStack(alignment: .leading, spacing:0){
                    Text("Why us ?")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 18))
                        .foregroundColor(Colors.main)
                    
                    Text("- Choose our application for effortless and efficient doctor and clinic reservations, ensuring prompt access to healthcare, our user-friendly interface and comprehensive appointment management make healthcare scheduling convenient and reliable, and we also handle user- facing issues using traditional booking methods.")
                        .font(.custom(GFFonts.Segui, size: 18))
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
    }
}

#Preview {
    AboutUsView()
}
