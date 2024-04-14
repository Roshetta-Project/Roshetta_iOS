//
//  BookingView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 02/04/2024.
//

import SwiftUI

struct BookingView: View {
    // MARK: - Properties
    @State private var selectedDayIndex = 0
    @State private var selectedTimeIndex = 0
    
    let days = ["Sat","Sun", "Mon", "Tue", "Wed", "Thu", "Fri"]
    let times = ["10:00 AM", "11:00 AM", "1:00 PM", "2:00 PM", "3:00 PM"]
    
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.init(red: 0.44, green: 0.76, blue: 0.97, alpha: 1.00)
        UISegmentedControl.appearance().backgroundColor = .white
        let selectedAttributes: [NSAttributedString.Key:Any] = [
            .foregroundColor : UIColor.black,
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(selectedAttributes, for: .selected)
        let normalAttributes: [NSAttributedString.Key:Any] = [
          .foregroundColor : UIColor.lightGray,
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(normalAttributes, for: .normal)
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
                Text("Select Date:")
                .font(.custom(GFFonts.SeguiSemiBold, size: 18))
//                Picker(selection: $selectedDayIndex, label: Text("")) {
//                    ForEach(0..<7) { index in
//                        Button(action: {}) {
//                            Text(self.days[index])
//                        }
//                    }
//                }
//                .pickerStyle(SegmentedPickerStyle())
                
                DaysDateScrollView()
                
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
        Spacer()
    }
}

#Preview {
    BookingView()
}



