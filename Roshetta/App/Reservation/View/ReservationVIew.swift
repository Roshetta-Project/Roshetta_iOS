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
        let reservations: [Reservation] = {
            switch selectedPage {
            case 0: return Reservation.mockProcessing
            case 1: return Reservation.mockCompleted
            case 2: return Reservation.mockCanceled
            default: return []
            }
        }()
        
        if reservations.isEmpty {
            VStack {
                Spacer()
                Image(systemName: "calendar.badge.exclamationmark")
                    .font(.system(size: 60))
                    .foregroundColor(.gray.opacity(0.3))
                Text("No reservations found")
                    .font(.headline)
                    .foregroundColor(.secondary)
                Spacer()
            }
        } else {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    ForEach(reservations) { item in
                        ReservationCard(
                            date: "\(item.date) at \(item.startTime)",
                            status: item.status,
                            doctorName: item.doctorName,
                            startTime: "Starts at \(item.startTime)",
                            endTime: "Ends at \(item.endTime)",
                            salary: item.price,
                            salaryDescription: "Expecting cash payment",
                            statusColor: item.statusColor
                        )
                        .padding(.horizontal)
                        .padding(.top, 8)
                    }
                }
            }
        }
    }}

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
