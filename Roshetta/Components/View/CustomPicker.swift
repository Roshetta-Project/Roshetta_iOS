//
//  Picker.swift
//  Roshetta
//
//  Created by Sami Ahmed on 01/04/2024.
//

import SwiftUI

struct CustomPicker: View {
    @State private var searchText = ""
    @State private var isEditing = false
    @State private var isListVisible = false
    let cities = ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix"]
    
    var body: some View {
        ZStack(alignment: .trailing) {
            TextField("Choose", text: $searchText, onEditingChanged: { editing in
                isEditing = editing
                isListVisible = editing // Show list when editing begins
            })
            .padding()
            .frame(height: 50)
            .background(Color.white)
            .cornerRadius(8)
            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 4, y: 2)
            
            if isListVisible {
                List {
                    ForEach(cities.filter({ searchText.isEmpty || $0.localizedCaseInsensitiveContains(searchText) }), id: \.self) { city in
                        Text(city)
                            .onTapGesture {
                                searchText = city
                                isListVisible = false
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil) // Dismiss keyboard
                            }
                    }
                }
                .frame(maxHeight: 150)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                .offset(x: 0, y: 60) // Adjust this value according to your design
            }
            
            Image(systemName: "chevron.down")
                .foregroundColor(.gray)
                .padding(.trailing, 10)
        }
    }
}

struct CustomPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomPicker()
    }
}
