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
                    .font(.custom(GFFonts.SeguiSemiBold, size: 24))
                    .padding(.top, 50)
                Spacer()
                
                HStack(spacing: 32) {
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
                                .foregroundColor(selectedGender == "male" ? .blue : .gray)
                        }
                        Text("Male")
                            .font(.custom(GFFonts.SeguiSemiBold, size: 20))
                            .foregroundColor(.gray)
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
                                .foregroundColor(selectedGender == "female" ? .blue : .gray)
                        }
                        Text("Female")
                            .font(.custom(GFFonts.SeguiSemiBold, size: 20))
                            .foregroundColor(.gray)
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
