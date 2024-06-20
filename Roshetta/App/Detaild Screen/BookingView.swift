//
//  BookingView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 02/04/2024.
//

import SwiftUI

struct BookingView: View {
    // MARK: - Properties
    //    @State private var selectedDayIndex = 0
    //    @State private var selectedTimeIndex = 0
    //
    //    let days = ["Sat","Sun", "Mon", "Tue", "Wed", "Thu", "Fri"]
    //    let times = ["10:00 AM", "11:00 AM", "1:00 PM", "2:00 PM", "3:00 PM"]
    //
    //    init(){
    //        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.init(red: 0.44, green: 0.76, blue: 0.97, alpha: 1.00)
    //        UISegmentedControl.appearance().backgroundColor = .white
    //        let selectedAttributes: [NSAttributedString.Key:Any] = [
    //            .foregroundColor : UIColor.black,
    //        ]
    //        UISegmentedControl.appearance().setTitleTextAttributes(selectedAttributes, for: .selected)
    //        let normalAttributes: [NSAttributedString.Key:Any] = [
    //            .foregroundColor : UIColor.lightGray,
    //        ]
    //        UISegmentedControl.appearance().setTitleTextAttributes(normalAttributes, for: .normal)
    //    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            Text("Select Date")
            
            DaysDateScrollView()
            
          TimeScrollView()
            

            
            HStack{
                GFButton(isLoading: .constant(false),
                         text: "Cancel",
                         backgroundColor: Color.white,
                         foregroundColot: Colors.main) {
                    // TODO: - Cancel
                }.overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Colors.main, lineWidth: 2)
                )
                
                GFButton(isLoading: .constant(false),
                         text: "Confirm",
                         backgroundColor: Colors.main,
                         foregroundColot: Color.white) {
                    // TODO: - Confirm
                }
            }.padding(.top, 18)
            
            
        }
        .font(.custom(GFFonts.SeguiSemiBold, size: 18))
        .padding()
        Spacer()
    }
}

#Preview {
    BookingView()
}
