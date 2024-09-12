//
//  AppetizerListViewModel.swift
//  Appetizer
//
//  Created by Shiva on 9/7/24.
//

import Foundation

class AppetizerListViewModel: ObservableObject {
    
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var selectedAppetizer: Appetizer?
    @Published var isShowingDetailView = false
    
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { [weak self] result in
            
            
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let appetizers):
                    self?.appetizers = appetizers
                    
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self?.alertItem = AlertContext.invalidURL
                    case .invalidData:
                        self?.alertItem = AlertContext.invalidURL
                    case .unableToComplete:
                        self?.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self?.alertItem = AlertContext.invalidURL
                    }
                }
            }
          
            
        }
    }

}
