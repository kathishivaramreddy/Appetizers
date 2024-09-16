//
//  AccountView.swift
//  Appetizer
//
//  Created by Shiva on 9/5/24.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var accountViewModel =  AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    
                    TextField("First Name", text: $accountViewModel.user.firstName)
                        .autocapitalization(.none)
                    TextField("Last Name", text: $accountViewModel.user.lastName)
                        .textInputAutocapitalization(.never)
                    TextField( "Email", text: $accountViewModel.user.email)
                        .keyboardType (.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    DatePicker( "Birthday", selection: $accountViewModel.user.birthdate, displayedComponents: .date)
                    Button {
                        accountViewModel.saveChanges()
                        print("Save")
                    } label: {
                        Text("Save Changes")
                    }
                }.textInputAutocapitalization(.never)
                
                Section(header: Text ("Requests")) {
                    Toggle( "Extra Napkins", isOn: $accountViewModel.user.extraNapkins)
                    Toggle( "Frequent Refills", isOn: $accountViewModel.user.frequentRefills)
                }
            }.navigationTitle("Account")
        }.alert(item: $accountViewModel.alertItem) { item in
            Alert(title: item.title, message: item.message, dismissButton: item.dismissButton)
        }
    }
}


#Preview {
    AccountView()
}
