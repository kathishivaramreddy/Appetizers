//
//  AppetizerListView.swift
//  Appetizer
//
//  Created by Shiva on 9/5/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var appetizerViewModel = AppetizerListViewModel()
    
    var body: some View {
        NavigationStack {
            
            List(appetizerViewModel.appetizers) { appetizer in
                
               AppetizerListCellView(appetizer: appetizer)
            }
            .navigationTitle("Appetizer")
        }
        
        .onAppear() {
            appetizerViewModel.getAppetizers()
        }
        
    }

}

#Preview {
    AppetizerListView()
}
