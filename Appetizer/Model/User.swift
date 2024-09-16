//
//  User.swift
//  Appetizer
//
//  Created by Shiva on 9/16/24.
//

import Foundation

struct User: Codable {
    
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
