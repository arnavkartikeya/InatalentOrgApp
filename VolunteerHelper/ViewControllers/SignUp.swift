//
//  SignUp.swift
//  VolunteerHelper
//
//  Created by Arnav Kartikeya on 3/9/19.
//  Copyright © 2019 Arnav Kartikeya. All rights reserved.
//

import UIKit
import Firebase

class SignUp: UIViewController {

    @IBOutlet weak var sgErrorTwo: UILabel!
    @IBOutlet weak var sgemail: UITextField!
    @IBOutlet weak var sgusername: UITextField!
    @IBOutlet weak var sgpassword: UITextField!
    @IBOutlet weak var sgError: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sgError.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    


    
    @IBAction func registerPressed(_ sender: Any) {
        let SignError = sgError.text
        let email = sgemail.text
        let username = sgusername.text
        let password = sgpassword.text
        if((password?.count)! < 6){
            //display label
            sgError.isHidden = false
        }else{
            sgError.isHidden = true;
        }
        Auth.auth().createUser(withEmail: email!, password: password!, completion: {user, error in
            if(error == nil){
                print("login succesful")
            }
        })
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
