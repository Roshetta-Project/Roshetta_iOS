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
    @State private var shouldNavigate = false // State variable for navigation
    
    // MARK: - Body
    var body: some View {
        NavigationView {
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
                    
                    self.nextButton
                }
                .padding()
            }
            .navigationViewStyle(StackNavigationViewStyle()) // Ensure correct display on all devices
        }
    }
    
    private var nextButton: some View {
        NavigationLink(destination: medicationsView().navigationBarBackButtonHidden(true), isActive: $shouldNavigate) {
            GFButton(isLoading: $isLoading, text: "Next", backgroundColor: Colors.main, foregroundColot: Color.white) {
                self.shouldNavigate = true // Activate navigation when "Next" is tapped
            }
        }
        .buttonStyle(PlainButtonStyle()) // Ensure GFButton behaves like a regular button inside NavigationLink
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
                                height -= d.height + 25
                            }
                            let result = width
                            if problem == self.$healthProblems.last!.wrappedValue {
                                width = 0
                            } else {
                                width -= d.width + 30
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
