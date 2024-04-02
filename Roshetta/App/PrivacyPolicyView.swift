//
//  PrivacyPolicyView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 02/04/2024.
//

import SwiftUI

struct PrivacyPolicyView: View {
    var body: some View {
        ScrollView{
            VStack(alignment:.leading,spacing: 8){
                HStack(spacing:0){
                    Text("Privacy Policy for ")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 16))
                        .foregroundColor(.gray)
                    Text("[ROSHETTA]")
                        .font(.custom(GFFonts.SeguiBold, size: 16))
                        .foregroundColor(Colors.main)
                }
                HStack(spacing:0){
                    Text("1.")
                        .font(.custom(GFFonts.SeguiBold, size: 16))
                        .foregroundColor(Colors.main)
                    
                    Text("Information We Collect")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 16))
                        .foregroundColor(.gray)
                }
                Text(" - We may collect personal information such as name, email, and phone number when you register or use our app.")
                    .font(.custom(GFFonts.Segui, size: 16))
                    .foregroundColor(.gray)
                
                HStack(spacing:0){
                    Text("2.")
                        .font(.custom(GFFonts.SeguiBold, size: 16))
                        .foregroundColor(Colors.main)
                    
                    Text("How We Use Your Information")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 16))
                        .foregroundColor(.gray)
                }
                Text(" -We use your information to provide and improve our services, customize content, and communicate with you.")
                    .font(.custom(GFFonts.Segui, size: 16))
                    .foregroundColor(.gray)
                
                HStack(spacing:0){
                    Text("3.")
                        .font(.custom(GFFonts.SeguiBold, size: 16))
                        .foregroundColor(Colors.main)
                    
                    Text("Data Security")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 16))
                        .foregroundColor(.gray)
                }
                Text(" -We employ industry-standard security measures to protect your data.")
                    .font(.custom(GFFonts.Segui, size: 16))
                    .foregroundColor(.gray)
                
                HStack(spacing:0){
                    Text("4.")
                        .font(.custom(GFFonts.SeguiBold, size: 16))
                        .foregroundColor(Colors.main)
                    
                    Text("Third-Party Services")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 16))
                        .foregroundColor(.gray)
                }
                Text("-We may use third-party services that have their own privacy policies. Please review those policies.")
                    .font(.custom(GFFonts.Segui, size: 16))
                    .foregroundColor(.gray)
                
                HStack(spacing:0){
                    Text("5.")
                        .font(.custom(GFFonts.SeguiBold, size: 16))
                        .foregroundColor(Colors.main)
                    
                    Text("Cookies and Tracking")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 16))
                        .foregroundColor(.gray)
                }
                Text("-We use cookies and similar tracking technologies to enhance your experience and analyze usage")
                    .font(.custom(GFFonts.Segui, size: 16))
                    .foregroundColor(.gray)
                
                HStack(spacing:0){
                    Text("6.")
                        .font(.custom(GFFonts.SeguiBold, size: 16))
                        .foregroundColor(Colors.main)
                    
                    Text("Data Sharing")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 16))
                        .foregroundColor(.gray)
                }
                Text("-We do not sell your personal information to third parties.")
                    .font(.custom(GFFonts.Segui, size: 16))
                    .foregroundColor(.gray)
                
                HStack(spacing:0){
                    Text("7.")
                        .font(.custom(GFFonts.SeguiBold, size: 16))
                        .foregroundColor(Colors.main)
                    
                    Text("Your Choices")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 16))
                        .foregroundColor(.gray)
                }
                Text("-You can update or delete your account and opt-out of marketing communications.")
                    .font(.custom(GFFonts.Segui, size: 16))
                    .foregroundColor(.gray)
                
                HStack(spacing:0){
                    Text("8.")
                        .font(.custom(GFFonts.SeguiBold, size: 16))
                        .foregroundColor(Colors.main)
                    
                    Text("Children's Privacy")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 16))
                        .foregroundColor(.gray)
                }
                Text("-Our app is not intended for children under 13. We do not knowingly collect their data.")
                    .font(.custom(GFFonts.Segui, size: 16))
                    .foregroundColor(.gray)
                
                HStack(spacing:0){
                    Text("9.")
                        .font(.custom(GFFonts.SeguiBold, size: 16))
                        .foregroundColor(Colors.main)
                    
                    Text(" Changes to This Policy")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 16))
                        .foregroundColor(.gray)
                }
                Text("-We may update our privacy policy. Check for updates regularly.")
                    .font(.custom(GFFonts.Segui, size: 16))
                    .foregroundColor(.gray)
                
                HStack(spacing:0){
                    Text("10.")
                        .font(.custom(GFFonts.SeguiBold, size: 16))
                        .foregroundColor(Colors.main)
                    
                    Text(" Contact Us")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 16))
                        .foregroundColor(.gray)
                }
                Text("-If you have questions or concerns, contact us.")
                    .font(.custom(GFFonts.Segui, size: 16))
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

#Preview {
    PrivacyPolicyView()
}
