//
//  HealthProblemsView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 01/04/2024.
//

import SwiftUI

struct HealthProblemsView: View {
    // MARK: - Properties
    @State private var isLoading = false
    @State private var healthProblems = [
        "Diabetes", "Hypertension", "Pregnancy", "Insulin Resistance", "Pco",
        "Favism", "Autoimmune and Inflammation", "Hypertension and Diabetes",
        "Gout", "Gastric Sleeve", "High Cholesterol", "Lactose Intolerance",
        "Hepatic Patient", "Familial Mediterranean", "Kidney Disease",
        "Hypertension and Autoimmune Diseases", "Hyperthyroidism", "Hypothyroidism"
    ]
    @State private var selectedHealthProblems: [String: Bool] = [:]
    let numberOfColumns = 3
    
    // MARK: - Body
    var body: some View {
        ZStack {
            CircularGradient()
            
            VStack(alignment: .leading) {
                Text("If you have any health problems, Just select it!")
                    .font(.custom(GFFonts.SeguiSemiBold, size: 24))
                    .padding(.top, 50)
                
                healthProblemsGrid
                    .padding(.vertical)
                
                Spacer()
                
                nextButton
            }
            .padding()
        }
    }
    
    private var healthProblemsGrid: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: numberOfColumns), spacing: 10){
            ForEach(healthProblems, id: \.self) { problem in
                Toggle(isOn: Binding(
                    get: { selectedHealthProblems[problem] ?? false },
                    set: { selectedHealthProblems[problem] = $0 }
                ), label: {
                    Text(problem)
                }).toggleStyle(HealthProblemToggle(isSelected: selectedHealthProblems[problem] ?? false))
            }
        }
    }
    
    private var nextButton: some View {
            GFButton(isLoading: $isLoading, text: "Next", backgroundColor: Colors.main, foregroundColot: Color.white) {}
        }
}


#Preview {
    HealthProblemsView()
}
