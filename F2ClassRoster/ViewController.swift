//
//  ViewController.swift
//  F2ClassRoster
//
//  Created by Lance Park on 10/30/14.
//  Copyright (c) 2014 Lance Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // ViewController Class Properties
    
    var myPerson = Person(first: "Lance", last: "Park", student: true)
    var people = [Person] ()
    
    // Outlets: IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    

    // Function Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
       
        if let peopleFromArchive = self.loadFromArchive() as [Person]? {
            self.people = peopleFromArchive
        }
        else {
            self.loadFromPlist()
            self.saveToArchive()
            
        }
        // Create Person Objects to fill People
        //var lancePark = Person(first: "Lance", last: "Park", student: true)
//        var robertLee = Person(first: "Robert", last: "Lee", student: true)
//        var maryPark = Person(first: "Mary", last: "Park", student: false)
//        var johnGrossi = Person(first: "John", last: "Grossi", student: false)
//        var richLee = Person(first: "Rich", last: "Lee", student: false)
//        
//        self.people  = [lancePark, robertLee, maryPark, johnGrossi, richLee]
//        
        
    }

    
    @IBAction func pushButton(sender: UIButton) {
        println(myPerson.getFullName())
    
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        
    }
    
    
    
    // Implement Protocal Functions
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return people.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCellWithIdentifier("PERSON_CELL", forIndexPath: indexPath) as PersonTableViewCell
    
        // cell.backgroundColor = UIColor.blueColor()
        
        var personToDisplay = self.people[indexPath.row]
        
        //cell.textLabel.text = personToDisplay.getFullName()
        
        cell.firstLabel.text = personToDisplay.firstName
        cell.lastLabel.text = personToDisplay.lastName
        
        if personToDisplay.image != nil {
            cell.portrait.image = personToDisplay.image
        }
        
        return cell
        
    }
    
    func loadFromPlist() {
        
        let plistURL = NSBundle.mainBundle().pathForResource("Roster", ofType: "plist")
        
        let plistArray = NSArray(contentsOfFile: plistURL!)
        for object in plistArray! {
            if let personDictionary = object as? NSDictionary {
                let firstName = personDictionary["First Name"] as String
                let lastName = personDictionary["Last Name"] as String
                let isStudent = personDictionary["Is Student"] as Bool
                var person = Person(first: firstName, last: lastName, student: isStudent)
                self.people.append(person)
            }
        }
        
        
    }
    
    func loadFromArchive() -> [Person]? {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        if let peopleFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsPath + "/archive1") as? [Person] {
            return peopleFromArchive
        }
        return nil
    }
    
    func saveToArchive() {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        NSKeyedArchiver.archiveRootObject(self.people, toFile: documentsPath + "/archive1")
    }

    
    // Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "SHOW_DETAIL" {
        
            let detailViewController = segue.destinationViewController as DetailViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            var personToPass = self.people[selectedIndexPath!.row]
            
            detailViewController.selectedPerson = personToPass
        
        }
        
    }
    
}


