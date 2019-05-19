//
//  Login.swift
//  VolunteerHelper
//
//  Created by Arnav Kartikeya on 3/9/19.
//  Copyright © 2019 Arnav Kartikeya. All rights reserved.
//

import UIKit
import Firebase
class Login: UIViewController {

    
    @IBOutlet weak var lgError: UILabel!
    @IBOutlet weak var lgEmail: UITextField!
    @IBOutlet weak var lgPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lgError.isHidden = true;
    }
    

    
    
    @IBAction func loginPressed(_ sender: Any) {
        Auth.auth().signIn(withEmail: lgEmail.text!, password: lgPass.text!, completion: {user, error in
            if(error == nil){
                print("login succesful")
                self.performSegue(withIdentifier: "success", sender: self)
            }
            else{
                print("login failed")
                self.lgError.isHidden = false
            }
        })
    }
    
    
  
}
