//
//  ReservationVIew.swift
//  Roshetta
//
//  Created by Sami Ahmed on 01/04/2024.
//

import SwiftUI

// MARK: - PROPERTYS
struct ReservationVIew: View {
    @State private var selectedPage = 0
    var buttonAction: () -> Void

    // MARK: - VIEW
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 0) {
                    CustomSegmentedControl(title: "Processing", index: 0, selectedIndex: $selectedPage)
                    CustomSegmentedControl(title: "Completed", index: 1, selectedIndex: $selectedPage)
                    CustomSegmentedControl(title: "Canceled", index: 2, selectedIndex: $selectedPage)
                }
                .padding()
                
                getPageContent()
                
                Spacer()
            }
            .navigationBarItems(
                leading:
                    Button {
                       buttonAction()
                    } label: {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(.gray)
                    },
                trailing:
                    NavigationLink(destination: SearchBar()) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                    }
            )
            .navigationBarTitle("", displayMode: .inline)

        }
    }
    
    // MARK: - Functions
    @ViewBuilder
    func getPageContent() -> some View {
        switch selectedPage {
        case 0:
            //Processing
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing:-10){
                    ForEach(0..<10){Index in
                        ReservationCard(date: "Sep 28 2023 at 04:00 pm", status: "Processing", doctorName: "Doctor. Shrouk Ahmed", startTime: "Start at 04:00 pm ", endTime: "Ends at 04:30 pm", salary: "350 L.E", salaryDescription: "Expecting cash payment", statusColor: .yellow)
                            .padding()
                    }
                }
            }
            
        case 1:
            //Completed
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0..<10){Index in
                    ReservationCard(date: "Sep 28 2023 at 04:00 pm", status: "Completed", doctorName: "Doctor. Shrouk Ahmed", startTime: "Start at 04:00 pm ", endTime: "Ends at 04:30 pm", salary: "350 L.E", salaryDescription: "Expecting cash payment", statusColor: .green)
                        .padding()
                }
        }
        case 2:
            //Canceled
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0..<10){Index in
                    ReservationCard(date: "Sep 28 2023 at 04:00 pm", status: "Canceled", doctorName: "Doctor. Shrouk Ahmed", startTime: "Start at 04:00 pm ", endTime: "Ends at 04:30 pm", salary: "350 L.E", salaryDescription: "Expecting cash payment", statusColor: .red)
                        .padding()
                }
        }
        default:
            Text("Error: Invalid Page")
        }
        
    }
}

// MARK: - Preview
struct ReservationVIew_Previews: PreviewProvider {
    static var previews: some View {
        ReservationVIew(buttonAction: {})
    }
}

// MARK: - Segment
struct CustomSegmentedControl: View {
    var title: String
    var index: Int
    @Binding var selectedIndex: Int
    
    var body: some View {
        Button(action: {
            self.selectedIndex = self.index
        }) {
            Text(title)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .foregroundColor(index == selectedIndex ? .white : .gray)
                .background(index == selectedIndex ? Colors.main : Color.clear)
                .cornerRadius(8)
        }
    }
}
