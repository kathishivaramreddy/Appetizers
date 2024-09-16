//
//  AccountViewModel.swift
//  Appetizer
//
//  Created by Shiva on 9/16/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
        
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func retrieveUser() {
        
        guard let userData = userData else {
            alertItem = AlertContext.invaliUserdData
            return
        }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
            
        } catch {
            
            alertItem = AlertContext.invaliUserdData
        }
    }
    
    func saveChanges() {
        
        if isValidForm {
            do {
                
                let data = try JSONEncoder().encode(user)
                userData = data
                alertItem = AlertContext.userSaved
            } catch {
                
                alertItem = AlertContext.invaliUserdData
            }
        }
    }
}
