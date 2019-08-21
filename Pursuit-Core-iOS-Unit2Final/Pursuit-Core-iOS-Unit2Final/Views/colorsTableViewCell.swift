//
//  colorsTableViewCell.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Kary Martinez on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class colorsTableViewCell: UITableViewCell {
    @IBOutlet weak var nameOfColorLabel: UILabel!
    
    @IBOutlet weak var hexLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
