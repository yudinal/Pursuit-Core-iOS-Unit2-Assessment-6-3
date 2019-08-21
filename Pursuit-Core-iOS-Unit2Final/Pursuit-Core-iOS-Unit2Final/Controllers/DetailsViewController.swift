//
//  DetailsViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Sunni Tang on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var alphaStepper: UIStepper!
    
    var currentCrayon: Crayon?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let currentCrayon = currentCrayon {
            self.view.backgroundColor = UIColor(red: CGFloat(currentCrayon.red/255), green: CGFloat(currentCrayon.green/255), blue: CGFloat(currentCrayon.blue/255), alpha: 1)
        }
    }
    
    
    
    @IBAction func sliderChangeValue(_ sender: UISlider) {
    }
    
  
    @IBAction func stepperChangeValue(_ sender: UIStepper) {
    }
    

}
