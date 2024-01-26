//
//  NetworkLayerTestView.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-01-25.
//

import SwiftUI

struct NetworkLayerTestView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 32) {
            
            Text("Example on network layer")
                .font(.system(size: 18, weight: .bold))
                .padding(.bottom, 32)
            
            
            Button {
                //TODO: - Get data from api
            } label: {
                Text("Fetch Data")
                    .font(.system(size: 16, weight: .bold))
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 48,
                        maxHeight: 48
                    )
                    .padding(.horizontal, 32)
                    .foregroundColor(Color.white)
                    .background {
                        Colors.text
                    }
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.2), radius: 8)
            }

            Button {
                //TODO: - Get data from api
            } label: {
                Text("Multipart data")
                    .font(.system(size: 16, weight: .bold))
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 48,
                        maxHeight: 48
                    )
                    .padding(.horizontal, 32)
                    .foregroundColor(Color.white)
                    .background {
                        Colors.main
                    }
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.2), radius: 8)
            }

            Button {
                //TODO: - Get Post
            } label: {
                Text("Post Data")
                    .font(.system(size: 16, weight: .bold))
                    .frame(
                        maxWidth: .infinity,
                        minHeight: 48,
                        maxHeight: 48
                    )
                    .padding(.horizontal, 32)
                    .foregroundColor(Color.white)
                    .background {
                        Colors.secondary
                    }
                    .cornerRadius(16)
                    .shadow(color: Color.black.opacity(0.2), radius: 8)
            }
        }
        .padding(.horizontal)
    }
}

struct NetworkLayerTestView_Previews: PreviewProvider {
    static var previews: some View {
        NetworkLayerTestView()
    }
}
