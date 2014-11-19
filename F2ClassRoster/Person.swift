//
//  Person.swift
//  F2ClassRoster
//
//  Created by Lance Park on 11/5/14.
//  Copyright (c) 2014 Lance Park. All rights reserved.
//

import Foundation
import UIKit

class Person {
    
    //Properties
    var firstName = "Lance"
    var lastName = "Park"
    var isStudent : Bool = true
    var image : UIImage?
    
    
    //Initializer
    init (first : String, last : String, student : Bool) {
        self.firstName = first
        self.lastName = last
        self.isStudent = student
    }
    //Methods
    func getFullName() -> String {
        //Return students full name
        //return firstName + " " + lastName
        return "\(self.firstName) \(self.lastName)"
        
    }
    
}
