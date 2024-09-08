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
        ZStack {
            
            NavigationStack {
                
                List(appetizerViewModel.appetizers) { appetizer in
                    
                   AppetizerListCellView(appetizer: appetizer)
                }
                .navigationTitle("Appetizer")
            }
            .onAppear() {
                appetizerViewModel.getAppetizers()
            }
            
            if appetizerViewModel.isLoading {
                ProgressView()
                    .controlSize(.extraLarge)
            }
            
            
        }.alert(item: $appetizerViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
       
        
    }

}

#Preview {
    AppetizerListView()
}
