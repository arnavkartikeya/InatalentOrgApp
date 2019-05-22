//
//  EventsTableViewController.swift
//  VolunteerHelper
//
//  Created by Arnav Kartikeya on 4/27/19.
//  Copyright © 2019 Arnav Kartikeya. All rights reserved.
//

import UIKit
import Firebase
class Events {
    var eventName: String?
    var eventNum: String?
    var eventDesc: String?
    
    init(prName:String, prCategory:String, prDesc:String) {
        self.eventName = prName
        self.eventNum = prCategory
        self.eventDesc = prDesc
    }
}
class EventsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    
    @IBOutlet var tblEvents: UITableView!
    var eventsArray = [Events]();
    //test
    var ref: DatabaseReference!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        // print(self.eventsArray)
        ref = Database.database().reference()
        ref.child("Events").observe(.value, with: {(data) in
            let events = data.value as! [String:[String:Any]]
            for (_, value) in events {
                //print(value["EventTitle"]);
                let event = Events(prName: value["EventTitle"]! as! String, prCategory: value["numPeople"] as! String, prDesc: value["EventDescription"] as! String)
                self.eventsArray.append(event)
            }
            self.tblEvents.reloadData()
            self.tblEvents.dataSource = self
            self.tblEvents.delegate = self
        })
        
        
    }
   
    //Mark:- My Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "productstable")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "productstable")
        }
        
        cell?.textLabel?.text = eventsArray[indexPath.row].eventName
        cell?.detailTextLabel?.text = eventsArray[indexPath.row].eventNum
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.product = eventsArray[(tblEvents.indexPathForSelectedRow?.row)!]
            tblEvents.deselectRow(at: tblEvents.indexPathForSelectedRow!, animated: true)
            
        }
    }
        
        
        /*
         override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
         
         // Configure the cell...
         
         return cell
         }
         */
        
        /*
         // Override to support conditional editing of the table view.
         override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
         return true
         }
         */
        
        /*
         // Override to support editing the table view.
         override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
         // Delete the row from the data source
         tableView.deleteRows(at: [indexPath], with: .fade)
         } else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
         }
         */
        
        /*
         // Override to support rearranging the table view.
         override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
         
         }
         */
        
        /*
         // Override to support conditional rearranging of the table view.
         override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the item to be re-orderable.
         return true
         }
         */
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
