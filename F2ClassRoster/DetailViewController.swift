//
//  DetailViewController.swift
//  F2ClassRoster
//
//  Created by Lance Park on 11/18/14.
//  Copyright (c) 2014 Lance Park. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //Properties
    
    var selectedPerson = Person(first: "John", last: "Doe", student: false)
    var imagePickerController = UIImagePickerController()
    
    //Outlets
    
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var isStudent: UITextField!
    
    @IBOutlet weak var portrait: UIImageView!
    
    
    //Functions
    
    @IBAction func selectPhotoRelease(sender: AnyObject) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            self.imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            
            self.imagePickerController.delegate = self
            
            self.imagePickerController.allowsEditing = true
            self.presentViewController(self.imagePickerController, animated: true, completion: nil)
            
        }
        
        
        
    }
    
    
    //Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.selectedPerson.getFullName()
        self.firstName.delegate = self
        self.lastName.delegate = self
        self.isStudent.delegate = self
        
        // Do any additional setup after loading the view.
        
        // Assign text field text
        
        self.firstName.text = selectedPerson.firstName
        self.lastName.text = selectedPerson.lastName
       
        if (self.selectedPerson.isStudent) {
            self.isStudent.text = "Student"
        } else {
            self.isStudent.text = "Not enrolled"
        
        }
        
       self.portrait.image = selectedPerson.image
    }
    
    //Implement Protocal Code Functions
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        //Update Selected Person's Name
        
        switch textField {
        case firstName:
            self.selectedPerson.firstName = textField.text
        case lastName:
            self.selectedPerson.lastName = textField.text
        default:
            textField.resignFirstResponder()
            
            
        }
        
        
        //Dismiss Keyboard after pressing enter
        
        textField.resignFirstResponder()
        return true
        
        
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerEditedImage] as UIImage
        self.portrait.image = image
        
        imagePickerController.dismissViewControllerAnimated(true, completion: nil)
        self.selectedPerson.image = image
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
