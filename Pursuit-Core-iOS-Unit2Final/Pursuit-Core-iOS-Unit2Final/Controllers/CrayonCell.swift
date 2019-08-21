//
//  CrayonCell.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Aaron Pachesa on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CrayonCell: UITableViewCell {

    @IBOutlet weak var crayonName: UILabel!
    
    @IBOutlet weak var crayonHex: UILabel!
    
    func setCrayon(crayon: Crayon) {
        crayonName.text = crayon.name
        crayonHex.text = crayon.hex
    }
}
