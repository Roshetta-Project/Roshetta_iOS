//
//  DateTimeScrollView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 14/04/2024.
//

import SwiftUI

struct SelectableScrollView: View {
    // MARK: - Properties
    let items: [String]
//    let onSelect: (String?) -> Void
    
    @State private var selectedIndex: Int?
    
    // MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(items, id: \.self) { item in
                    Button(action: {
                        let index = items.firstIndex(of: item)
                        if selectedIndex == index {
                            selectedIndex = nil
                        } else {
                            selectedIndex = index
//                            onSelect(item)
                        }
                    }) {
                        Text(item)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(selectedIndex == items.firstIndex(of: item) ? Colors.main : .white)
                                    .shadow(color: .gray.opacity(0.3), radius: 4, x: 2, y: 2)
                            )
                    }
                }
            }.padding(.vertical)
        }
    }
}




#Preview {
    SelectableScrollView(items: ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"])
    
//    SelectableScrollView(items:  [
//        "2:30 pm", "3:00 pm", "3:30 pm", "4:00 pm", "4:30 pm", "5:00 pm",
//        "5:30 pm", "6:00 pm", "6:30 pm", "7:00 pm", "7:30 pm", "8:00 pm",
//        "8:30 pm", "9:00 pm", "9:30 pm"
//    ])
    
    
//    { selectedItem in
//        // Handle selection
//        print("Selected item: \(selectedItem ?? "None")")
//    }
}
