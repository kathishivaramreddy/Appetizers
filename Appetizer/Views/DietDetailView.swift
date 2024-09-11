//
//  DietDetailView.swift
//  Appetizer
//
//  Created by Shiva on 9/11/24.
//

import SwiftUI

struct DietDetailView: View {
    var title: String
    var description: LocalizedStringKey
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            Text(description)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    DietDetailView(title: "test title", description: "test description")
}
