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
    

    
    
    // MARK: - Body
    var body: some View {
        ZStack {
            CircularGradient()
            
            VStack(alignment: .leading) {
                Text("If you have any health problems, Just select it!")
                    .font(.custom(GFFonts.SeguiSemiBold, size: 24))
                    .padding(.top, 50)
                
                GeometryReader { geo in
                    self.generateContent(in: geo)
                }
                
                Spacer()
                
                nextButton
            }
            .padding()
        }
    }
    
    private var nextButton: some View {
            GFButton(isLoading: $isLoading, text: "Next", backgroundColor: Colors.main, foregroundColot: Color.white) {}
        }
    
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading){
            ForEach(healthProblems, id: \.self) { problem in
                Toggle(isOn: Binding(
                    get: { selectedHealthProblems[problem] ?? false },
                    set: { selectedHealthProblems[problem] = $0 }
                ), label: {
                    Text(problem)
                        .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width) {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if problem == self.$healthProblems.last!.wrappedValue {
                            width = 0
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                })
                .toggleStyle(HealthProblemToggle(isSelected: selectedHealthProblems[problem] ?? false))
                    .alignmentGuide(.top, computeValue: { d in
                        let result = height
                        if problem == self.$healthProblems.last!.wrappedValue {
                            height = 0
                        }
                        return result
                    })
            }
        }
    }
}


#Preview {
    HealthProblemsView()
}
