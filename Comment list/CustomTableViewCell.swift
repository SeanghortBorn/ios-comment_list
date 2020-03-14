//
//  CustomTableViewCell.swift
//  Comment list
//
//  Created by iMac-09 on 3/14/20.
//  Copyright © 2020 itc. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var commentborder: UIView!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        profileImage.layer.cornerRadius = profileImage.frame.width/2

        commentborder.layer.cornerRadius = 5
    }

}
