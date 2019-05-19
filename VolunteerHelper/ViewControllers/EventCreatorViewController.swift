//
//  EventCreatorViewController.swift
//  VolunteerHelper
//
//  Created by Arnav Kartikeya on 3/9/19.
//  Copyright © 2019 Arnav Kartikeya. All rights reserved.
//

import UIKit
import Firebase
class EventCreatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var datePicker: UITextField!
    
//Code for Date picker

    
    @IBOutlet weak var eventTitle: UITextField!
    
    @IBOutlet weak var numberOfPeople: UILabel!

    
    var num: Float = 0.0;


    
    
    @IBAction func slide(_ sender: UISlider) {
        num = sender.value
        numberOfPeople.text = String(Int(num))
        
        
    }
    
    @IBAction func registerEvent(_ sender: UIButton) {
        //push stuff to firebase
        let eventName = eventTitle.text!
        let eventDB = Database.database().reference().child("Events")
        let eventDict = ["EventTitle": eventTitle.text!, "numPeople": numberOfPeople.text!]
        
        eventDB.child(eventName).setValue(eventDict){
            (error, reference) in
            if(error != nil){
                print(error!)
            }
        }
    } 

}
