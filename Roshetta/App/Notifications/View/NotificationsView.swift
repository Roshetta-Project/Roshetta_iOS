//
//  NotificationsView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 31/03/2024.
//

import SwiftUI

struct NotificationsView: View {
    var buttonAction: () -> Void


    var body: some View {

        NavigationStack{
            ScrollView {
                LazyVStack (spacing:1){
                    ForEach(1..<10) { index in
                        NotificationCard(image: Image("clinc"),
                                         alert: "Remember!",
                                         description: "You have an appointment with Mrs. Shrouk Ahmed at 03:00 pm, Tomorrow.")
                            .overlay(index <= 4 ? Color.blue.opacity(0.2) : nil)
                    }
                }
            }
            .padding(.horizontal,-10)
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading:
                    Button {
                       buttonAction()
                    } label: {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(.gray)
                    },
                trailing:
                    NavigationLink(destination: SearchBar()) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                    }
            )
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView(buttonAction: {})
    }
}
