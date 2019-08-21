//
//  CrayonDetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alyson Abril on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CrayonDetailViewController: UIViewController {

    
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    
    var crayon: Crayon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    

    func updateViews() {
        colorNameLabel.text = crayon.name
        view.backgroundColor = UIColor(red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1)
    }
    
    
    
    @IBAction func redSlider(_ sender: UISlider) {
        
        redValueLabel.text = "Red:   \(String(format: "%.3f", sender.value))"
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        greenValueLabel.text = "Green:   \(String(format: "%.3f", sender.value))"
    }
    
    @IBAction func blueSlider(_ sender: UISlider) {
        blueValueLabel.text = "Blue:   \(String(format: "%.3f", sender.value))"
    }
    
    
}
