//
//  DaysDateScrollView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 08/04/2024.
//

import SwiftUI

struct DaysDateScrollView: View {
    // MARK: - Properties
    let days = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"]
    @State private var selectedDayIndex: Int? = nil
    
    // MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(days.indices, id: \.self) { index in
                    Button {
                        if selectedDayIndex == index {
                            // If the same day is clicked again, deselect it
                            selectedDayIndex = nil
                        } else {
                            // Otherwise, select the clicked day and deselect all others
                            selectedDayIndex = index
                        }
                    } label: {
                        Text(days[index])
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .foregroundStyle(.black)
                            .font(.custom(GFFonts.Segui, size: 16))
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(selectedDayIndex == index ? Colors.main : Color.white)
                                    .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 2, y: 2)
                            )
                    }
                }
            }.padding()
        }
    }
}

#Preview {
    DaysDateScrollView()
}
