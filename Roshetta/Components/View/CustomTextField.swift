//
//  TextField.swift
//  Roshetta
//
//  Created by Sami Ahmed on 01/04/2024.
//

import SwiftUI

struct CustomTextField: View {
    @State private var text = ""
    
    var body: some View {
        TextField("Enter", text: $text)
            .padding()
            .frame(height: 50)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
    }
}


struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField()
    }
}
