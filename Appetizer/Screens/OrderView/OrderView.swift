//
//  OrderVIew.swift
//  Appetizer
//
//  Created by Shiva on 9/5/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack {
                    List {
                        
                        ForEach(order.items) {  appetizer in
                            
                            AppetizerListCellView(appetizer: appetizer)
                            
                        }
                       
                        .onDelete(perform: { indexSet in
                            
                            order.delete(indexSet)
                            
                        })
                      
                        
                    } .listStyle(.plain)
                    
                  
                    APButton(title: "$\(order.totalPrice, specifier: "%.2f") Place Order")
                        .padding(.bottom, 20)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", title: "Please order appetizers here.")
                }
            }
          
                .navigationTitle("Order")
        }
       
    }
}

#Preview {
    OrderView()
}
