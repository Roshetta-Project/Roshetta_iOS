//
//  ExerciseView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 01/04/2024.
//

import SwiftUI



struct ExerciseView: View {
    // MARK: - Properties
    @State private var isLoading = false
    @State private var exerciseDaily = true
    @State private var selectedExerciseType: String?
    @State private var showSecondQuestion = false
    @State private var shouldNavigate = false // State variable for navigation
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                CircularGradient()
                
                VStack(alignment: .leading) {
                    // MARK: - First Question
                    Text("Do you exercise daily?")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 24))
                        .padding(.top, 50)
                    
                    HStack {
                        Button(action: {
                            exerciseDaily = true
                        }) {
                            Image(systemName: exerciseDaily ? "checkmark.square" : "square")
                            Text("Yes")
                        }
                        .foregroundColor(exerciseDaily ? Colors.main : .gray)
                        
                        Spacer()
                        
                        Button(action: {
                            exerciseDaily = false
                        }) {
                            Image(systemName: exerciseDaily ? "square" : "checkmark.square")
                            Text("No")
                        }
                        .foregroundColor(exerciseDaily ? .gray : Colors.main)
                    }
                    .padding(5)
                    .padding(.horizontal, 25)
                    .font(.custom(GFFonts.Segui, size: 21))
                    .foregroundStyle(.black)
                    
                    
                    // MARK: - Second Question
                    if showSecondQuestion {
                        Text("What type of exercises do you do?")
                            .font(.custom(GFFonts.SeguiSemiBold, size: 24))
                            .padding(.top, 25)
                        
                        VStack(alignment: .leading) {
                            ForEach(["Strenuous", "Moderate", "Light"], id: \.self) { exerciseType in
                                Button(action: {
                                    selectedExerciseType = exerciseType
                                }) {
                                    HStack {
                                        Image(systemName: selectedExerciseType == exerciseType ? "checkmark.square" : "square")
                                        Text(exerciseType)
                                    }
                                    .padding(.vertical, 5)
                                }
                                .foregroundColor(selectedExerciseType == exerciseType ? Colors.main : .gray)
                            }
                        }
                        .padding(.horizontal, 25)
                        .font(.custom(GFFonts.Segui, size: 21))
                        .transition(.slide)
                        .animation(.easeInOut)
                    }
                    
                    Spacer()
                    
                    // MARK: - Next Button with NavigationLink
                    VStack {
                        HStack {
                            Spacer()
                            Image("homeVector")
                        }
                        
                        NavigationLink(destination: HealthProblemsView(), isActive: $shouldNavigate) {
                            GFButton(isLoading: $isLoading, text: "Next", backgroundColor: Colors.main, foregroundColot: Color.white) {
                                showSecondQuestion = true
                                shouldNavigate = true // Activate navigation when "Next" is tapped
                            }
                        }
                        .buttonStyle(PlainButtonStyle()) // Ensures GFButton behaves like a regular button inside NavigationLink
                    }
                    .padding()
                }
                .padding()
            }
            .navigationViewStyle(StackNavigationViewStyle()) // Ensure correct display on all devices
        }
    }
}



#Preview {
    ExerciseView()
}
