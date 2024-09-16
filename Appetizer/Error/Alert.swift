//
//  Alert.swift
//  Appetizer
//
//  Created by Shiva on 9/7/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    static let invalidData      = AlertItem(title: Text("Server Error"),
                                            message: Text("The data received from the server was invalid. Please contact support."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidResponse  = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid response from the server. Please try again later or contact support."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidURL       = AlertItem(title: Text("Sever Error"),
                                            message: Text("There was an issue connecting to the server. If this persists, please contact support."),
                                            dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                            message: Text("Form is incomplete, Please fill the form"),
                                            dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                            message: Text("Please enter proper email"),
                                            dismissButton: .default(Text("OK")))
    
    static let userSaved = AlertItem(title: Text("User Saved"),
                                            message: Text("User Saved Successfully"),
                                            dismissButton: .default(Text("OK")))
    
    static let invaliUserdData = AlertItem(title: Text("invalid Data"),
                                       message: Text("User data invalid"),
                                       dismissButton: .default(Text("OK")))
    
    
}
