//
//  NetworkLayerTestView.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-01-25.
//

import SwiftUI

struct NetworkLayerTestView: View {
    
    // MARK: - PROPERTYS
    private var vm = NetworkLayerViewModel()
    
    // MARK: - VIEW
    
    var body: some View {
        VStack(alignment: .center, spacing: 32) {
            
            Text("Example on network layer")
                .font(.system(size: 18, weight: .bold))
                .padding(.bottom, 32)
            
            createButton(title: "Fetch Data", backgroundColor: Colors.text) {
                Task {
                    await vm.fetchProducts()
                }
            }

            createButton(title: "Post Data", backgroundColor: Colors.secondary) {
                Task {
                    await vm.addProduct()
                }
            }
            
            createButton(title: "Multipart data", backgroundColor: Colors.main) {
                Task {
                    print("Upload data")
                }
            }
            
        }
        .padding(.horizontal)
        
    }
    
    // MARK: - FUNCTIONS
    
    private func createButton(title: String, backgroundColor: Color, action: @escaping () -> Void) -> some View {
        Button {
            //TODO: - Get Post
            action()
        } label: {
            Text(title)
                .font(.system(size: 16, weight: .bold))
                .frame(
                    maxWidth: .infinity,
                    minHeight: 48,
                    maxHeight: 48
                )
                .padding(.horizontal, 32)
                .foregroundColor(Color.white)
                .background {
                    backgroundColor
                }
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.2), radius: 8)
        }
    }
    
}

struct NetworkLayerTestView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkLayerTestView()
    }
}
