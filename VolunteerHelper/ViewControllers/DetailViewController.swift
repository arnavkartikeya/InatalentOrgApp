//
//  DetailViewController.swift
//  VolunteerHelper
//
//  Created by Arnav Kartikeya on 5/18/19.
//  Copyright © 2019 Arnav Kartikeya. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var product: Events?
    
    @IBOutlet weak var lblDetails: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblDetails.text = "\((product?.eventName)!) needs this many people \((product?.eventNum)!)!"
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
