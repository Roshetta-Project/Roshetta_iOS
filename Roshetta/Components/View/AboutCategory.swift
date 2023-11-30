//
//  AboutCategory.swift
//  Roshetta
//
//  Created by Sami Ahmed on 30/11/2023.
//

import SwiftUI

struct AboutCategory: View {
    // MARK: - PROPERTIES
    let aboutText: String
    
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
            .shadow(color: .black.opacity(0.1), radius: 2, x: 2, y: 4)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}


struct AboutCategory_Previews: PreviewProvider {
    static var previews: some View {
        AboutCategory(aboutText: "Dr. Ahmed is a highly skilled and compassionate dentist dedicated to providing comprehensive oral care to his patients. With a wealth of knowledge and experience in dentistry, he excels in diagnosing and treating various dental conditions, ranging from routine cleanings to complex procedures. ")
    }
}
