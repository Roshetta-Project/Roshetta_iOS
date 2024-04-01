//
//  CircularGradient.swift
//  Roshetta
//
//  Created by Sami Ahmed on 23/03/2024.
//

import SwiftUI

struct CircularGradient: View {
    var body: some View {
        VStack{
            //top
            RadialGradient(gradient: Gradient(colors: [Colors.main.opacity(0.3), Color.white]),
                           center: .topLeading,
                           startRadius: 0,
                           endRadius: UIScreen.main.bounds.width )
            .edgesIgnoringSafeArea(.all)
            //buttom
            RadialGradient(gradient: Gradient(colors: [Colors.main.opacity(0.3), Color.white]),
                           center: .bottomTrailing,
                           startRadius: 0,
                           endRadius: UIScreen.main.bounds.width )
            .edgesIgnoringSafeArea(.all)
            
        }
    }
}

#Preview {
    CircularGradient()
}
