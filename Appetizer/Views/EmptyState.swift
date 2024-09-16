//
//  EmptyState.swift
//  Appetizer
//
//  Created by Shiva on 9/16/24.
//

import SwiftUI

struct EmptyState: View {
    
    var imageName: String
    var title: String
    
    var body: some View {
        ZStack {
            
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-order", title: "Test State")
}
