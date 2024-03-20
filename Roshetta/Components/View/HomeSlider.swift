//
//  HomeSlider.swift
//  Pickup
//
//  Created by Abdalazem Saleh on 2023-10-17.
//

import SwiftUI

struct HomeSlider: View {
    // MARK: - PROPERTYS
    
    @State private var currentIndex: Int = 0
    @Binding var slides: [String]

    // MARK: - VIEW
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(slides.indices, id: \.self) { index in
                slideView(for: slides[index])
                    .tag(index)
            }
        }
        .frame(width: UIScreen.main.bounds.size.width - 40, height: 184)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Colors.main, lineWidth: 1)
        )
    }
    
    // MARK: - FUNCTIONS
    
    private func slideView(for imageName: String) -> some View {
        Image(imageName)
            .resizable()
            .cornerRadius(15)
            .aspectRatio(contentMode: .fill)
    }
}

struct HomeSlider_Previews: PreviewProvider {
    static var previews: some View {
        HomeSlider(slides: .constant(["Banner", "Banner","user"]))
    }
}
