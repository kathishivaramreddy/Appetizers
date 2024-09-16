//
//  OrderVIew.swift
//  Appetizer
//
//  Created by Shiva on 9/5/24.
//

import SwiftUI

struct OrderView: View {
    
    @State var orderedAppetizer = MockData.orderItems
    @State var totalOrderPrice = 0.0
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack {
                    List {
                        
                        ForEach(orderedAppetizer) {  appetizer in
                            
                            AppetizerListCellView(appetizer: appetizer)
                            
                        }
                       
                        .onDelete(perform: { indexSet in
                            for index in indexSet {
                                orderedAppetizer.remove(at: index)
                            }
                            totalOrderPrice = Double(orderedAppetizer.reduce(0) { partialResult, appetizer in
                                partialResult + appetizer.price
                            })
                        })
                      
                        
                    } .listStyle(.plain)
                    
                  
                    APButton(title: "$\(totalOrderPrice, specifier: "%.2f") Place Order")
                        .padding(.bottom, 20)
                        .onAppear {
                            totalOrderPrice = Double(orderedAppetizer.reduce(0) { partialResult, appetizer in
                                partialResult + appetizer.price
                            })
                        }
                }
                
                if orderedAppetizer.isEmpty {
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
