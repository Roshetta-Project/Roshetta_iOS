//
//  BookingView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 02/04/2024.
//

import SwiftUI

struct BookingView: View {
    @State private var selectedDayIndex = 0
    @State private var selectedTimeIndex = 0
    
    let days = ["Sat","Sun", "Mon", "Tue", "Wed", "Thu", "Fri"]
    let times = ["10:00 AM", "11:00 AM", "1:00 PM", "2:00 PM", "3:00 PM"]
    
    var body: some View {
            VStack {
                Text("Select Date:")
                Picker(selection: $selectedDayIndex, label: Text("")) {
                    ForEach(0..<7) { index in
                        Button(action: {}) {
                            Text(self.days[index])
                        }
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                Text("Select Schedule Day:")
                Picker(selection: $selectedTimeIndex, label: Text("")) {
                    ForEach(0..<5) { index in
                        Button(action: {}) {
                            Text(self.times[index])
                        }
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding()
    }
    
    
//    public struct CustomPickerStyle : PickerStyle {
//    }
}

#Preview {
    BookingView()
}



