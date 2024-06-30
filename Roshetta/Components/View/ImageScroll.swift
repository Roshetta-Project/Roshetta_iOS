//
//  ImageScroll.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-01.
//

import SwiftUI

struct ImageScroll: View {
    @State private var selectedImage: ImageInfo?
    let images: [String]
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(images, id: \.self) { image in
                    
                    AsyncImage(url: image.asUrl) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .frame(width: 72, height: 72)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 0.12, green: 0.27, blue: 0.32), lineWidth: 1)
                                )
                               
                        case .failure(let error):
                            Image("user")
                                .resizable()
                                .frame(width: 72, height: 72)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 0.12, green: 0.27, blue: 0.32), lineWidth: 1)
                                )
                                
                        @unknown default:
                            Image("user")
                                .resizable()
                                .frame(width: 72, height: 72)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 0.12, green: 0.27, blue: 0.32), lineWidth: 1)
                                )
                                
                        }
                    }
                }
            }
        }
        .padding(10)
        .sheet(item: $selectedImage) { selected in
            ImageDetailView(imageName: selected.name)
        }
        
    }
}

struct ImageInfo: Identifiable {
    let id = UUID()
    let name: String
}

struct ImageDetailView: View {
    let imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                // Handle tap if needed
            }
    }
}

struct ImageScroll_Previews: PreviewProvider {
    static var previews: some View {
        ImageScroll(images: [])
    }
}

