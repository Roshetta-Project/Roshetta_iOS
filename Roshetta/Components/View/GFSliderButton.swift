//
//  GFSliderButton.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-27.
//

import SwiftUI

struct GFSliderButton: View {
    // MARK: - PROPERTYS
    @Binding var isAnimating: Bool
    var buttonAction: () -> Void
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    // MARK: - VIEW
    var body: some View {
        ZStack {
            // BACK GROUND
            Capsule()
                .fill(Colors.main)
            
            // CALL TO ACTION TEXT
            Text("Get started")
                .font(.custom(GFFonts.popinsSemiBold, size: 24))
                .foregroundColor(.white)
            
            // CAPSUL DYNAMIC
            HStack {
                Capsule()
                    .fill(
                        LinearGradient(
                            colors: [Colors.main, Colors.secondary],
                            startPoint: .leading,
                            endPoint: .trailing)
                    )
                    .frame(width: buttonOffset + 18)
                    .padding(.leading)
                
                Spacer()
            }
            
            // DRAGABLE CIRCLE
            HStack {
                ZStack {
                    Capsule()
                        .fill(.white)
                        .padding(4)
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Colors.text)
                } //: ZStack
                .foregroundColor(.white)
                .frame(width: 56, height: 56, alignment: .center)
                .offset(x: buttonOffset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 48 {
                                buttonOffset = gesture.translation.width
                            }
                        }
                        .onEnded { _ in
                            withAnimation(Animation.easeInOut(duration: 0.4)) {
                                if buttonOffset > buttonWidth / 2 {
                                    hapticFeedback.notificationOccurred(.success)
                                    buttonAction()
                                } else {
                                    hapticFeedback.notificationOccurred(.warning)
                                    buttonOffset = 0
                                }
                            }
                        }
                ) //: GESTURE
                
                Spacer()
            } //: HStack
        }
        .frame(width: buttonWidth, height: 56, alignment: .center)
        .padding()
        .opacity(isAnimating ? 0: 1)
        .offset(y: isAnimating ? 40 : 0)
        .animation(.easeOut(duration: 1), value: isAnimating)
    }
}

struct GFSliderButton_Previews: PreviewProvider {
    static var previews: some View {
        GFSliderButton(isAnimating: .constant(false), buttonAction: {})
    }
}
