//
//  NewTableViewCell.swift
//  VolunteerHelper
//
//  Created by Arnav Kartikeya on 5/17/19.
//  Copyright © 2019 Arnav Kartikeya. All rights reserved.
//

import UIKit

protocol TableViewNew {
    func onClickCell(index: Int);
}

class NewTableViewCell: UITableViewCell {
    
    var cellDelegate: TableViewNew?
    var index: IndexPath?
    
     
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    } 
    @IBAction func didClick(_ sender: Any) {
        cellDelegate?.onClickCell(index: (index?.row)!)
    }

}
