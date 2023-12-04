//
//  AboutCardView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 30/11/2023.
//

import SwiftUI

struct AboutCardView: View {
    // MARK: - PROPERTIES
    let aboutText: String
    
    // MARK: - VIEW
    var body: some View {
        Text(aboutText)
            .font(.system(size: 14))
            .foregroundColor(Color("text").opacity(0.65))
            .multilineTextAlignment(.leading)
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color("main"), lineWidth: 1)
                    )
            )
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal, 10)
    }
}


struct AboutCardView_Previews: PreviewProvider {
    static var previews: some View {
        AboutCardView(aboutText: "Dr. Ahmed is a highly skilled and compassionate dentist dedicated to providing comprehensive oral care to his patients. With a wealth of knowledge and experience in dentistry, he excels in diagnosing and treating various dental conditions, ranging from routine cleanings to complex procedures. ")
    }
}
