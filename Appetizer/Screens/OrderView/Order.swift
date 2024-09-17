//
//  Order.swift
//  Appetizer
//
//  Created by Shiva on 9/17/24.
//

import Foundation

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        
        items.reduce(0) { partialResult, appetizer in
            partialResult + appetizer.price
        }
    }
    
    func add(_ appertizer: Appetizer) {
        
        items.append(appertizer)
    }
    
    func delete(_ offset: IndexSet) {
        items.remove(atOffsets: offset)
    }
}
