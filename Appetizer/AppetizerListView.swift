//
//  AppetizerListView.swift
//  Appetizer
//
//  Created by Shiva on 9/5/24.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationStack {
            
            List(MockData.appetizers) { appetizer in
                
               AppetizerListCellView(appetizer: appetizer)
            }
            .navigationTitle("Appetizer")
        }
        
    }
}

#Preview {
    AppetizerListView()
}
