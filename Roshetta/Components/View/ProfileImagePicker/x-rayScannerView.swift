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
  @State private var showProgressView = false // Flag for progress view
  @State private var uploadTimer: Timer? // Timer for upload simulation

  // MARK: - VIEW
  var body: some View {
    VStack {
      Text("Upload your X-ray")
        .font(.custom(GFFonts.SeguiSemiBold, size: 40))
        .foregroundColor(Colors.MenuBar)

      if let selectedImage = selectedImage {
        selectedImage
          .resizable()
          .scaledToFill()
          .frame(width: 250, height: 250)
          .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4)
      } else {
        Image("ray")
          .resizable()
          .scaledToFill()
          .foregroundColor(Colors.MenuBar)
          .frame(width: 250, height: 250)
          .cornerRadius(10, corners: UIRectCorner())
          .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4)
      }

      Button(action: {
        isImagePickerPresented.toggle()
        showProgressView = true
        startUploadTimer()
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

        if showProgressView {
                ProgressView()
                .progressViewStyle(.circular)
                  .frame(width: 300, height: 150)
                  
                    Text("Processing... Please wait")
                        .font(.custom(GFFonts.SeguiSemiBold, size: 20))
                      .foregroundColor(.black)
                  
              }
    }
    .sheet(isPresented: $isImagePickerPresented) {
      Picker(selectedImage: $selectedImage)
    }
    .onDisappear(perform: {
      // Invalidate timer on view disappearance
      uploadTimer?.invalidate()
    })
  }

  // Function to start the upload simulation timer
  func startUploadTimer() {
    uploadTimer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { _ in
      showProgressView = false
        
        ResultView()
    }
  }
}

struct ray_Previews: PreviewProvider {
    static var previews: some View {
        rayScannerView(image: "person.fill")
    }
}



