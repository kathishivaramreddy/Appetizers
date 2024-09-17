//
//  AppetizerApp.swift
//  Appetizer
//
//  Created by Shiva on 9/2/24.
//

import SwiftUI

@main
struct AppetizerApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
