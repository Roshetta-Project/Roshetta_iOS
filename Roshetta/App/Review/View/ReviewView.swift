//
//  ReviewView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 11/04/2024.
//

import SwiftUI
struct ReviewView: View {
    var body: some View {
             ScrollView {
                 LazyVStack {
                     ForEach(1..<10) { index in
                         BigReviewCard(userName: "Abdalazem Saleh", description: "Great history!, I’m very happy and i will do it again", rate: 4, date: "1/1/2024")
                             .padding(.vertical, 8)
                     }
                 }
                 .padding(.horizontal)
         }
    }
}

#Preview {
    ReviewView()
}
