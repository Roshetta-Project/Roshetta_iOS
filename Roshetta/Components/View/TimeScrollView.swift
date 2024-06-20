//
//  TimeScrollView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 14/04/2024.
//

import SwiftUI

struct TimeScrollView: View {
    // MARK: - Properties
    let times = [
        "2:30 pm", "3:00 pm", "3:30 pm", "4:00 pm", "4:30 pm", "5:00 pm",
        "5:30 pm", "6:00 pm", "6:30 pm", "7:00 pm", "7:30 pm", "8:00 pm",
        "8:30 pm", "9:00 pm", "9:30 pm"
    ]
    @State private var selectedDayIndex: Int? = nil
    
    // MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(times.indices, id: \.self) { index in
                    Button {
                        if selectedDayIndex == index {
                            // If the same day is clicked again, deselect it
                            selectedDayIndex = nil
                        } else {
                            // Otherwise, select the clicked day and deselect all others
                            selectedDayIndex = index
                        }
                    } label: {
                        Text(times[index])
                            .padding(.vertical, 8)
                            .padding(.horizontal, 10)
                            .foregroundStyle(.black)
                            .font(.custom(GFFonts.SeguiSemiBold, size: 14))
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(selectedDayIndex == index ? Colors.main : Color.white)
                                    .shadow(color: Color.gray.opacity(0.3), radius: 4, x: 2, y: 2)
                            )
                    }
                }
            }.padding(.vertical)
        }
    }
}

#Preview {
    TimeScrollView()
}
