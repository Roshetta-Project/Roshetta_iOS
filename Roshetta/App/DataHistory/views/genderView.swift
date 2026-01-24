//
//  genderView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 01/04/2024.
//

import SwiftUI

struct GenderView: View {
    // MARK: - PROPERTIES
    @Binding var selectedGender: String?
    @State private var shouldNavigate: Bool = false

    // MARK: - VIEW
    var body: some View {
        ZStack {
            CircularGradient()
            
            VStack {
                Text("Tell me what's your gender?")
                    .font(Typography.title2)
                    .padding(.top, Spacing.xxxLarge)
                Spacer()
                
                HStack(spacing: Spacing.xLarge) {
                    // Male Image Button
                    VStack {
                        Button(action: {
                            selectedGender = "male"
                            shouldNavigate = true
                        }) {
                            Image("male")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .foregroundColor(selectedGender == "male" ? Colors.main : Colors.secondaryLabel)
                        }
                        Text("Male")
                            .font(Typography.title3)
                            .foregroundColor(Colors.secondaryLabel)
                    }
                    
                    // Female Image Button
                    VStack {
                        Button(action: {
                            selectedGender = "female"
                            shouldNavigate = true
                        }) {
                            Image("female")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .foregroundColor(selectedGender == "female" ? Colors.main : Colors.secondaryLabel)
                        }
                        Text("Female")
                            .font(Typography.title3)
                            .foregroundColor(Colors.secondaryLabel)
                    }
                }
                Spacer()
                Spacer()
            }
            
            // Navigation Link
            NavigationLink(destination: DateOfBirthView(), isActive: $shouldNavigate) {
                EmptyView()
            }
            
        }
    }
}



struct GenderSelectionView: View {
    @State private var selectedGender: String? = nil
    
    var body: some View {
        NavigationView {
            GenderView(selectedGender: $selectedGender)
        }
    }
}

struct GenderSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GenderSelectionView()
    }
}
