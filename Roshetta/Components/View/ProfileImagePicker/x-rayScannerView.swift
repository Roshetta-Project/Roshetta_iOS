//
//  ProfileImageView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 02/04/2024.
//

import SwiftUI



struct rayScannerView: View {
    // MARK: - PROPERTIES
    let image: String
    @State private var selectedImage: Image?
    @State private var isImagePickerPresented = false
    
    // MARK: - VIEW
    var body: some View {
        VStack {
            if let selectedImage = selectedImage {
                selectedImage
                
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4)
            }else {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Colors.MenuBar)
                    .frame(width: 250, height: 250)
                    .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4)
            }
            
            Button(action: {
                isImagePickerPresented.toggle()
            }) {
                Image(systemName: "camera.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.white)
            }
            .padding(8)
            .background(Colors.main)
            .clipShape(Circle())
            .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 2)
        }
        .sheet(isPresented: $isImagePickerPresented) {
            Picker(selectedImage: $selectedImage)
        }
    }
}

struct ray_Previews: PreviewProvider {
    static var previews: some View {
        rayScannerView(image: "person.fill")
    }
}



