//
//  CircularGradient.swift
//  Roshetta
//
//  Created by Sami Ahmed on 03/02/2024.
//

import SwiftUI

struct CircularGradient: View {
    var body: some View {
        RadialGradient(gradient: Gradient(colors: [Colors.newmain.opacity(0.3), Color.white]),
                       center: .topLeading,
                       startRadius: 0,
                       endRadius: UIScreen.main.bounds.width )
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    CircularGradient()
}

