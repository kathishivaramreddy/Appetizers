//
//  AppetizerListView.swift
//  Appetizer
//
//  Created by Shiva on 9/5/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var appetizerViewModel = AppetizerListViewModel()
    @State var isShowingDetailView = false
    
    var body: some View {
        ZStack {
            
            NavigationStack {
                
                List(appetizerViewModel.appetizers) { appetizer in
                    
                   AppetizerListCellView(appetizer: appetizer)
                        .onTapGesture {
                            appetizerViewModel.selectedAppetizer = appetizer
                            isShowingDetailView = true
                        }
                }
                .navigationTitle("Appetizer")
                .disabled(isShowingDetailView)
            }
            .onAppear() {
                appetizerViewModel.getAppetizers()
            }
            .blur(radius: isShowingDetailView ? 20 : 0)
            
            if isShowingDetailView {
                AppetizerDetailView(appetizerDetails: appetizerViewModel.selectedAppetizer ??  MockData.sampleAppetizer, isShowingDetailView: $isShowingDetailView)
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
