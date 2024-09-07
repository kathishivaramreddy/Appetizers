//
//  AppetizerListViewModel.swift
//  Appetizer
//
//  Created by Shiva on 9/7/24.
//

import Foundation

class AppetizerListViewModel: ObservableObject {
    
    
    @Published var appetizers: [Appetizer] = []
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    print(error)
                }
            }
          
            
        }
    }

}
