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
                        .font(Typography.title2)
                        .padding(.top, Spacing.xxxLarge)
                    
                    HStack {
                        Button(action: {
                            exerciseDaily = true
                        }) {
                            Image(systemName: exerciseDaily ? "checkmark.square" : "square")
                            Text("Yes")
                        }
                        .foregroundColor(exerciseDaily ? Colors.main : Colors.secondaryLabel)
                        
                        Spacer()
                        
                        Button(action: {
                            exerciseDaily = false
                        }) {
                            Image(systemName: exerciseDaily ? "square" : "checkmark.square")
                            Text("No")
                        }
                        .foregroundColor(exerciseDaily ? Colors.secondaryLabel : Colors.main)
                    }
                    .padding(Spacing.xSmall)
                    .padding(.horizontal, Spacing.large)
                    .font(Typography.title3)
                    .foregroundStyle(.black)
                    
                    
                    // MARK: - Second Question
                    if showSecondQuestion {
                        Text("What type of exercises do you do?")
                            .font(Typography.title2)
                            .padding(.top, Spacing.large)
                        
                        VStack(alignment: .leading) {
                            ForEach(["Strenuous", "Moderate", "Light"], id: \.self) { exerciseType in
                                Button(action: {
                                    selectedExerciseType = exerciseType
                                }) {
                                    HStack {
                                        Image(systemName: selectedExerciseType == exerciseType ? "checkmark.square" : "square")
                                        Text(exerciseType)
                                    }
                                    .padding(.vertical, Spacing.xSmall)
                                }
                                .foregroundColor(selectedExerciseType == exerciseType ? Colors.main : Colors.secondaryLabel)
                            }
                        }
                        .padding(.horizontal, Spacing.large)
                        .font(Typography.title3)
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
                    .padding(Spacing.medium)
                }
                .padding(Spacing.medium)
            }
            .navigationViewStyle(StackNavigationViewStyle()) // Ensure correct display on all devices
        }
    }
}



#Preview {
    ExerciseView()
}
