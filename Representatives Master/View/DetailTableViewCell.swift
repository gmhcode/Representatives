//
//  DetailTableViewCell.swift
//  Representatives Master
//
//  Created by Greg Hughes on 12/13/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    
    var representative : Representative? {
        didSet {
            updateViews()
        }
    }
    
    
    func updateViews(){
        
        guard let representative = representative else {return}
        
        nameLabel.text = representative.name
        partyLabel.text = representative.party
        districtLabel.text = representative.district
        websiteLabel.text = representative.link
        phoneNumberLabel.text = representative.phone
        
    }
}

