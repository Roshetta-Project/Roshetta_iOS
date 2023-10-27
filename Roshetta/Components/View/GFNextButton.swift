//
//  GFNextButton.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-27.
//

import SwiftUI

struct GFNextButton: View {
    var buttonAction: () -> Void
    
    var body: some View {
        Button {
            buttonAction()
        } label: {
            Circle()
                .fill(Colors.main)
                .overlay {
                    Image(systemName: "chevron.forward")
                        .foregroundColor(.white)
                }
                .frame(width: 36, height: 36)
        }
    }
}

struct GFNextButton_Previews: PreviewProvider {
    static var previews: some View {
        GFNextButton(buttonAction: {})
    }
}
