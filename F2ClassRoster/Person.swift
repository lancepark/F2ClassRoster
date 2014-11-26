//
//  Person.swift
//  F2ClassRoster
//
//  Created by Lance Park on 11/5/14.
//  Copyright (c) 2014 Lance Park. All rights reserved.
//

import Foundation
import UIKit

class Person : NSObject, NSCoding {
    
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
    
    // NSCoding requirements
    
    required init(coder aDecoder: NSCoder) {
        self.firstName = aDecoder.decodeObjectForKey("firstName") as String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as String
        if let decodedImage = aDecoder.decodeObjectForKey("image") as? UIImage {
            self.image = decodedImage
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        
        if self.image != nil {
            aCoder.encodeObject(self.image, forKey: "image")
        } else {
            aCoder.encodeObject(nil, forKey: "image")
        }
    }
    
    
    //Methods
    func getFullName() -> String {
        //Return students full name
        //return firstName + " " + lastName
        return "\(self.firstName) \(self.lastName)"
        
    }
    
}
