//
//  StarRatingView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 04/04/2024.
//

import SwiftUI

struct StarRatingView: View {
    @State private var rating: Int = 0

    var body: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: index <= self.rating ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(index <= self.rating ? .yellow : .yellow)
                    .onTapGesture {
                        self.rating = index
                    }
            }
        }
    }
}



struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView()
    }
}
