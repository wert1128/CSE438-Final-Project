//
//  User.swift
//  CSE438 Final Project
//
//  Created by Mike Liu on 7/24/20.
//  Copyright © 2020 Michael Zhao. All rights reserved.
//

import Foundation

class User {
    var username: String
    var role: String
    
    init() {
        self.username = ""
        self.role = ""
    }
    init(_ username: String, _ role: String) {
        self.username = username
        self.role = role
    }
    
} 
