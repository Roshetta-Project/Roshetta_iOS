//
//  BookingView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 02/04/2024.
//

import SwiftUI

struct BookingView: View {
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    @State private var showConfirmationAlert = false
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.medium) {
            Text("Select Date")
                .font(Typography.headline)
                .foregroundColor(Colors.primaryLabel)
            
            DaysDateScrollView()
            
            TimeScrollView()
            
            Spacer()
            
            // MARK: - Action Buttons
            HStack(spacing: Spacing.medium) {
                // Cancel Button
                GFButton(isLoading: .constant(false),
                         text: "Cancel",
                         backgroundColor: Colors.surface,
                         foregroundColot: Colors.main) {
                    dismiss()
                }
                .overlay(
                    RoundedRectangle(cornerRadius: Dimensions.cornerRadiusMedium)
                        .stroke(Colors.main, lineWidth: 2)
                )
                
                // Confirm Button
                GFButton(isLoading: .constant(false),
                         text: "Confirm",
                         backgroundColor: Colors.main,
                         foregroundColot: Color.white) {
                    showConfirmationAlert = true
                }
            }
            .padding(.top, Spacing.medium)
        }
        .font(Typography.headline)
        .padding(Spacing.medium)
        .alert("Booking Confirmed! ✅", isPresented: $showConfirmationAlert) {
            Button("OK", role: .cancel) {
                dismiss()
            }
        } message: {
            Text("Your appointment has been successfully booked. You will receive a confirmation shortly.")
        }
    }
}

#Preview {
    BookingView()
}
