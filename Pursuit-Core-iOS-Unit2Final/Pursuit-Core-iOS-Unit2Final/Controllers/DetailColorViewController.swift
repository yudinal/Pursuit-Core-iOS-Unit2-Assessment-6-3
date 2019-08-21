//
//  DetailColorViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Phoenix McKnight on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
import UIKit

class DetailColorViewController: UIViewController {
    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var blueSliderLabel: UILabel!
    @IBOutlet weak var greenSliderLabel: UILabel!
    @IBOutlet weak var alphaSliderLabel: UILabel!
    
    @IBOutlet weak var redSliderLabel: UILabel!
    var passingInfo:Crayon!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNamesOfLabels()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func setUpNamesOfLabels() {
      redSliderLabel.text = "Red"
        blueSliderLabel.text = "Blue"
        greenSliderLabel.text = "Green"
        alphaSliderLabel.text = "Alpha"
    }
    
}
