//
//  OTPTextField.swift
//  Pickup
//
//  Created by Abdalazem Saleh on 2023-10-15.
//

import SwiftUI

struct OTPTextField: View {
    let numberOfFields: Int
    
    @Binding var enterValue: [String]
    @FocusState private var fieldFoucus: Int?
    @State private var oldValue: String = ""
    
    init(numberOfFields: Int, enterValue: Binding<[String]>) {
        self.numberOfFields = numberOfFields
        self._enterValue = enterValue
    }
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfFields, id: \.self) { index in
                TextField("", text: $enterValue[index], onEditingChanged: { editing in
                    if editing {
                        oldValue = enterValue[index]
                    }
                })
                    .keyboardType(.numberPad)
                    .frame(width: 48, height: 48)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .multilineTextAlignment(.center)
                    .focused($fieldFoucus, equals: index)
                    .tag(index)
                    .onChange(of: enterValue[index]) { newValue in
                        if enterValue[index].count > 1 {
                            let currentValue = Array(enterValue[index])
                            if currentValue[0] == Character(oldValue) {
                                enterValue[index] =  String(enterValue[index].suffix(1))
                            } else {
                                enterValue[index] =  String(enterValue[index].prefix(1))
                            }
                        }
                        if !newValue.isEmpty {
                            if index == numberOfFields - 1 {
                                fieldFoucus = nil
                            } else {
                                fieldFoucus = (fieldFoucus ?? 0) + 1
                            }
                        } else {
                            fieldFoucus = (fieldFoucus ?? 0) - 1
                        }
                    }
            }
        }
    }
}

struct OTPTextField_Previews: PreviewProvider {
    static var previews: some View {
        OTPTextField(numberOfFields: 6, enterValue: .constant(["", "", "", "", "", ""]))
    }
}
