//
//  CrayonCell.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Jocelyn Boyd on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CrayonCell: UITableViewCell {
  
  
  //MARK: -- Outlets
  @IBOutlet weak var crayonName: UILabel!
  @IBOutlet weak var crayonHexValue: UILabel!
  

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
