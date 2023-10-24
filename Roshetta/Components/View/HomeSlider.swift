//
//  HomeSlider.swift
//  Pickup
//
//  Created by Abdalazem Saleh on 2023-10-17.
//

import SwiftUI

struct HomeSlider: View {
    // MARK: - POPERTYS
    @State private var currentIndex: Int = 0
    @Binding var slides: [String]

    // MARK: - VIEW
    var body: some View {
        TabView {
            ForEach(slides.indices, id: \.self) { slide in
                Image(slides[slide])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(16)
            }
        }
        .cornerRadius(16)
        .tabViewStyle(PageTabViewStyle())
    }
    
    // MARK: - FUNCTIONS
}

struct HomeSlider_Previews: PreviewProvider {
    static var previews: some View {
        HomeSlider(slides: .constant(["Banner", "Banner"]))
    }
}
