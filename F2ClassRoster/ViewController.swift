//
//  ViewController.swift
//  F2ClassRoster
//
//  Created by Lance Park on 10/30/14.
//  Copyright (c) 2014 Lance Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myPerson = Person(first: "Lance", last: "Park", student: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func pushButton(sender: UIButton) {
        println(myPerson.getFullName())
    }
    
    
    
}

class Person {
    
    //Properties
    var firstName = "Lance"
    var lastName = "Park"
    var isStudent : Bool = true
    
    //Initializer
    init (first : String, last : String, student : Bool) {
        firstName = first
        lastName = last
        isStudent = student
    }
    //Methods
    func getFullName() -> String {
        println(firstName + " " + lastName)
        //Return students full name
        return firstName + " " + lastName
        
    }
    
}

