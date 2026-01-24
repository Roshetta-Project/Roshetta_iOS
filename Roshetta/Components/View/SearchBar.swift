//
//  SearchBar.swift
//  Roshetta
//
//  Created by Sami Ahmed on 27/03/2024.
//

import SwiftUI

struct SearchBar: View {
    @State private var searchText = ""
    @State private var searchResults: [String] = []
    
    var body: some View {
        VStack {
            HStack(spacing: Spacing.small) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Colors.secondaryLabel)
                    .padding(.leading, Spacing.small)
                
                TextField("Search for doctor name, clinic...", text: $searchText, onCommit: search)
                    .font(Typography.subheadline)
                    .foregroundColor(Colors.placeholderLabel)
                    .padding(.vertical, Spacing.small)
                    .padding(.trailing, Spacing.small)
                
            }
        }
        .background(
            RoundedRectangle(cornerRadius: Dimensions.cornerRadiusSmall)
                .foregroundColor(Colors.surface)
                .shadow(
                    color: Colors.primaryLabel.opacity(Dimensions.shadowOpacity),
                    radius: Dimensions.shadowRadius,
                    x: Dimensions.shadowX,
                    y: Dimensions.shadowY
                )
        )
        .frame(maxWidth: .infinity)
        .frame(height: Dimensions.buttonHeightMedium)
        .padding(.horizontal, Spacing.medium)
    }
    
    func search() {
        // Perform search logic here
        searchResults = ["Result 1", "Result 2", "Result 3"].filter { $0.contains(searchText) }
    }
}



#Preview {
    SearchBar()
}
