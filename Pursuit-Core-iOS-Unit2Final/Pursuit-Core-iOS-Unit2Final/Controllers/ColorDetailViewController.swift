//
//  ColorDetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Kevin Natera on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
import UIKit

class ColorDetailViewController : UIViewController {
    
    var color: Crayon!
    
    @IBOutlet weak var colorNameLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorNameLabel.text = color.name
        colorNameLabel.textColor = UIColor.white
        view.backgroundColor = UIColor(displayP3Red: CGFloat((color.red/255)), green: CGFloat((color.green/255)), blue: CGFloat((color.blue/255)), alpha: CGFloat(1.0))
    }
}
