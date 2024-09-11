//
//  APButton.swift
//  Appetizer
//
//  Created by Shiva on 9/11/24.
//

import SwiftUI

struct APButton: View {
    
    var title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(.tint)
            .cornerRadius(12)
    }
}

#Preview {
    APButton(title: "test button")
}
