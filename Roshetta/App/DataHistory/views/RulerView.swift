//
//  RulerView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 14/04/2024.
//

import SwiftUI

import SwiftUI

struct RulerView: View {
    @State private var isLoading = false
    let marksCount = 11
    let maxHeight: CGFloat = 400
    
    private var unit: String {
        "cm"
    }
    
    @State private var selectedHeight: CGFloat = 50
    @State private var shouldNavigate = false
    
    var body: some View {
        NavigationView {
            ZStack {
                CircularGradient()
                VStack(alignment:.leading, spacing: 100) {
                    Text("Select your height!")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 24))
                        .padding(10)
                        .padding(.top, 80)
                    
                    HStack {
                        HStack {
                            Text(String(format: "%.1f", selectedHeight))
                                .font(.custom(GFFonts.Segui, size: 24))
                            
                            Text(unit)
                                .font(.custom(GFFonts.Segui, size: 24))
                                .padding(.trailing)
                        }
                        .padding(60)
                        Spacer()
                        
                        Image("rule")
                            .resizable()
                            .frame(width: 100, height: 400)
                            .overlay(
                                GeometryReader { geometry in
                                    Rectangle()
                                        .fill(Color.clear)
                                        .contentShape(Rectangle())
                                        .gesture(
                                            DragGesture()
                                                .onChanged { value in
                                                    let offsetY = value.translation.height
                                                    let imageHeight = geometry.size.height
                                                    let maxMovement = imageHeight - maxHeight
                                                    
                                                    selectedHeight = min(max(0, selectedHeight + offsetY), maxHeight)
                                                }
                                        )
                                        .position(x: geometry.size.width / 2, y: selectedHeight / 2)
                                }
                            )
                    }
                    
                    GFButton(isLoading: $isLoading, text: "Next", backgroundColor: Colors.main, foregroundColot: Color.white) {
                        print("Next button tapped")
                        shouldNavigate = true
                    }
                    .padding()
                    
                    Spacer()
                }
                
                // Navigation Link
                NavigationLink(destination: AddressView(), isActive: $shouldNavigate) {
                    EmptyView()
                }
            }
        }
    }
}



#Preview {
    RulerView()
}
