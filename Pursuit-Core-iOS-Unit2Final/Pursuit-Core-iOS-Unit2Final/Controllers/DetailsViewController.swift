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
    let defaultAlpha = Crayon.defaultAlpha
    var currentAlpha: CGFloat = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialDetails()
    }
    
    
    func setInitialDetails() {

        if let currentCrayon = currentCrayon {
            let currentRedValue = currentCrayon.convertCrayonValue(value: currentCrayon.red)
            
            self.nameLabel?.text = currentCrayon.name
            redLabel?.text = "Red Value: \(currentRedValue)"
            greenLabel?.text = "Green Value: \(currentCrayon.green/255)"
            blueLabel?.text = "Blue Value: \(currentCrayon.blue/255)"
            alphaLabel?.text = "Alpha Value: \(defaultAlpha)"
            redSlider.value = Float(currentCrayon.red/255)
            greenSlider.value = Float(currentCrayon.green/255)
            blueSlider.value = Float(currentCrayon.blue/255)
            
            self.view.backgroundColor = UIColor(red: CGFloat(currentCrayon.red/255), green: CGFloat(currentCrayon.green/255), blue: CGFloat(currentCrayon.blue/255), alpha: defaultAlpha)
        }
    }
    
    
    
    @IBAction func sliderChangeValue(_ sender: UISlider) {
        if let currentCrayon = currentCrayon {
            switch sender.tag {
            case 0:
                self.view.backgroundColor = UIColor(red: CGFloat(sender.value), green: CGFloat(currentCrayon.green/255), blue: CGFloat(currentCrayon.blue/255), alpha: currentAlpha)
                redLabel?.text = "Red Value: \(sender.value)"
            case 1:
                self.view.backgroundColor = UIColor(red: CGFloat(currentCrayon.red/255), green: CGFloat(sender.value), blue: CGFloat(currentCrayon.blue/255), alpha: currentAlpha)
                greenLabel?.text = "Green Value: \(sender.value)"
            case 2:
                self.view.backgroundColor = UIColor(red: CGFloat(currentCrayon.red/255), green: CGFloat(currentCrayon.green/255), blue: CGFloat(sender.value), alpha: currentAlpha)
                blueLabel?.text = "Blue Value: \(sender.value)"
            default:
                fatalError("No slider was used")
            }
        }
    }
    
  
    @IBAction func stepperChangeValue(_ sender: UIStepper) {
        currentAlpha = CGFloat(sender.value)
        if let currentCrayon = currentCrayon {
            self.view.backgroundColor = UIColor(red: CGFloat(currentCrayon.red/255), green: CGFloat(currentCrayon.green/255), blue: CGFloat(currentCrayon.blue/255), alpha: currentAlpha)
        alphaLabel?.text = "Alpha Value: \(sender.value)"
        }
    }

}
