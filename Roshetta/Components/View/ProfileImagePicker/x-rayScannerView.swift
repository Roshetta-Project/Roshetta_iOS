//
//  ProfileImageView.swift
//  Roshetta
//
//  Created by Sami Ahmed on 02/04/2024.
//

import SwiftUI
import WebKit

struct rayScannerView: View {
    // MARK: - PROPERTIES
    let image: String
    @State private var selectedImage: Image?
    @State private var isImagePickerPresented = false
    @State private var showProgressView = false // Flag for progress view
    @State private var uploadTimer: Timer? // Timer for upload simulation
    var buttonAction: () -> Void
    
    
    // MARK: - VIEW
    var body: some View {
        NavigationView {
            WebView(
                urlString: "https://mohamedashraf404-roshetta-app-y9gq1g.streamlit.app/"
            )
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

struct WebView: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

struct ray_Previews: PreviewProvider {
    static var previews: some View {
        rayScannerView(image: "person.fill", buttonAction: {})
    }
}



