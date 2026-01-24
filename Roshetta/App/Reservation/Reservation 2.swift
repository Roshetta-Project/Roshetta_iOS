//
//  Reservation.swift
//  Roshetta
//
//  Created by Sami on 22/01/2026.
//

import Foundation
import SwiftUI


struct Reservation: Identifiable {
    let id = UUID()
    let doctorName: String
    let date: String
    let startTime: String
    let endTime: String
    let price: String
    let status: String
    let statusColor: Color
}

extension Reservation {
    static let mockProcessing: [Reservation] = [
        Reservation(doctorName: "Dr. Ahmed Mansour", date: "Jan 24, 2026", startTime: "04:00 PM", endTime: "04:30 PM", price: "600 L.E", status: "Processing", statusColor: .yellow),
        Reservation(doctorName: "Dr. Laila Soliman", date: "Jan 25, 2026", startTime: "11:30 AM", endTime: "12:00 PM", price: "450 L.E", status: "Processing", statusColor: .yellow),
        Reservation(doctorName: "Dr. Kareem Fouad", date: "Jan 27, 2026", startTime: "07:00 PM", endTime: "07:30 PM", price: "700 L.E", status: "Processing", statusColor: .yellow)
    ]
    
    static let mockCompleted: [Reservation] = [
        Reservation(doctorName: "Dr. Mostafa Hegazi", date: "Jan 10, 2026", startTime: "01:00 PM", endTime: "01:45 PM", price: "550 L.E", status: "Completed", statusColor: .green),
        Reservation(doctorName: "Dr. Mariam El-Shamy", date: "Jan 12, 2026", startTime: "03:00 PM", endTime: "03:30 PM", price: "350 L.E", status: "Completed", statusColor: .green),
        Reservation(doctorName: "Dr. Hany Ramses", date: "Jan 15, 2026", startTime: "06:00 PM", endTime: "06:30 PM", price: "650 L.E", status: "Completed", statusColor: .green)
    ]
    
    static let mockCanceled: [Reservation] = [
        Reservation(doctorName: "Dr. Nourhan El-Kholy", date: "Jan 05, 2026", startTime: "02:00 PM", endTime: "02:30 PM", price: "400 L.E", status: "Canceled", statusColor: .red)
    ]
}
