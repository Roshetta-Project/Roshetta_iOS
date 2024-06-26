//
//  DatePicker.swift
//  Roshetta
//
//  Created by Sami Ahmed on 21/06/2024.
//

import SwiftUI

struct DatePickeer: View {
    // MARK: - PROPERTYS
    @State private var birthDate = Date()
    @State private var isDateePickerVisible = false
    @State private  var isLoading = false
    
    // MARK: - VIEW
    var body: some View {
        ZStack {
            ScrollView{
                VStack {
                    Text("Select your date of birth!")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 24))
                        .padding(.top, 50)
                    
                    CustomButton(action: {
                        withAnimation {
                            isDateePickerVisible.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.gray)
                            
                            Text("Choose Date")
                                .font(.custom(GFFonts.Segui, size: 16))
                                .foregroundColor(.gray)
                            
                            Spacer()
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Colors.main, lineWidth: 1)
                        )
                        .background(Color.white)
                    }
                    .padding()
                    
                    
                    if isDateePickerVisible {
                        DatePicker("", selection: $birthDate, displayedComponents: .date)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .accentColor(Colors.main)
                            .padding()
                            .transition(.opacity)
                    }
                    
                    Text("Selected Date: \(formattedBirthDate)")
                        .font(.custom(GFFonts.Segui, size: 16))
                        .padding()
                    
                    GFButton(isLoading: $isLoading, text: "Next", backgroundColor: Colors.main, foregroundColot: Color.white) {
                        print("Next button tapped")
                        // Add your action here
                    }
                    .padding()
                    
                    Spacer()
                }
            }
        }
    }
    
    var formattedBirthDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: birthDate)
    }
}

struct CuustomButton<Content: View>: View {
    let action: () -> Void
    let content: () -> Content
    
    var body: some View {
        Button(action: action) {
            content()
        }
    }
}


#Preview {
    DatePickeer()
}
