//
//  ReservationCard.swift
//  Roshetta
//
//  Created by Sami Ahmed on 27/03/2024.
//

import SwiftUI

struct ReservationCard: View {
    // MARK: - PROPERTYS
    let date : String
    let status : String
    let doctorName: String
    let startTime : String
    let endTime : String
    let salary : String
    let salaryDescription : String
    // MARK: - VIEW
    var body: some View {
        VStack(alignment: .leading, spacing : 3){
            HStack{
                Text(date)
                    .font(.custom(GFFonts.Segui, size: 12))
                    .foregroundColor(Color.gray)
                Spacer()
                Text(status)
                    .font(.custom(GFFonts.SeguiSemiBold, size: 12))
                    .foregroundColor(Color.yellow)
            }
            Text(doctorName)
                .font(.custom(GFFonts.SeguiSemiBold, size: 14))
                .foregroundColor(Color.black)
                .padding(.vertical,1)
            VStack{
                Text(startTime)
                    .font(.custom(GFFonts.Segui, size: 10))
                    .foregroundColor(Color.gray)
                
                Text(endTime)
                    .font(.custom(GFFonts.Segui, size: 10))
                    .foregroundColor(Color.gray)
            }
            HStack(spacing:20){
                Text(salary)
                    .font(.custom(GFFonts.SeguiSemiBold, size: 14))
                    .foregroundColor(Color.black)
                
                Text(salaryDescription)
                    .font(.custom(GFFonts.Segui, size: 10))
                    .foregroundColor(Color.gray)
            }
        }
        .padding(30)
        .background(Color.gray.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    ReservationCard(date: "Sep 28 2023 at 04:00 pm", status: "processing", doctorName: "Doctor. Sami Ahmed", startTime: "Start at 04:00 pm ", endTime: "End at 04:00 pm ", salary: "350 L.E", salaryDescription: "Expecting cash payment")
}
