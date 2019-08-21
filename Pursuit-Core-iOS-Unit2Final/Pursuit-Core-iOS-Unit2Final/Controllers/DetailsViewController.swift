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
    
    var currentRedValue: CGFloat = 1.0
    var currentGreenValue: CGFloat = 1.0
    var currentBlueValue: CGFloat = 1.0
    var currentAlpha: CGFloat = 1.0
    let defaultAlpha = Crayon.defaultAlpha
    var currentRedText: CGFloat = 1.0
    var currentGreenText: CGFloat = 1.0
    var currentBlueText: CGFloat = 1.0
    var currentAlphaText: CGFloat = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialDetails()
    }
    
    
    func setInitialDetails() {

        if let currentCrayon = currentCrayon {
            
            currentRedValue = currentCrayon.convertCrayonValue(value: currentCrayon.red)
            currentGreenValue = currentCrayon.convertCrayonValue(value: currentCrayon.green)
            currentBlueValue = currentCrayon.convertCrayonValue(value: currentCrayon.blue)
            
            currentRedText = currentCrayon.roundValuesForLabel(value: currentRedValue)
            currentGreenText = currentCrayon.roundValuesForLabel(value: currentGreenValue)
            currentBlueText = currentCrayon.roundValuesForLabel(value: currentBlueValue)
            currentAlphaText = currentCrayon.roundValuesForLabel(value: currentAlpha)
            
            self.nameLabel?.text = currentCrayon.name
            redLabel?.text = "Red Value: \(currentRedText)"
            greenLabel?.text = "Green Value: \(currentGreenText)"
            blueLabel?.text = "Blue Value: \(currentBlueText)"
            alphaLabel?.text = "Alpha Value: \(currentAlphaText)"
            redSlider.value = Float(currentRedValue)
            greenSlider.value = Float(currentGreenValue)
            blueSlider.value = Float(currentBlueValue)
            
            setBackgroundColor()
        }
    }
    
    func setBackgroundColor() {
        self.view.backgroundColor = UIColor(red: currentRedValue, green: currentGreenValue, blue: currentBlueValue, alpha: currentAlpha)
    }
    
    @IBAction func sliderChangeValue(_ sender: UISlider) {
        if let currentCrayon = currentCrayon {
        switch sender.tag {
            case 0:
                currentRedValue = CGFloat(sender.value)
                redLabel?.text = "Red Value: \(currentRedText)"
            case 1:
                currentGreenValue = CGFloat(sender.value)
                greenLabel?.text = "Green Value: \(currentGreenText)"
            case 2:
                currentBlueValue = CGFloat(sender.value)
                blueLabel?.text = "Blue Value: \(currentBlueText)"
            default:
                fatalError("No slider was used")
        }
        currentRedText = currentCrayon.roundValuesForLabel(value: currentRedValue)
        currentGreenText = currentCrayon.roundValuesForLabel(value: currentGreenValue)
        currentBlueText = currentCrayon.roundValuesForLabel(value: currentBlueValue)
        
        setBackgroundColor()
    }
    }
    
  
    @IBAction func stepperChangeValue(_ sender: UIStepper) {
        if let currentCrayon = currentCrayon {
        currentAlpha = CGFloat(sender.value)
        currentAlphaText = currentCrayon.roundValuesForLabel(value: currentAlpha)
        alphaLabel?.text = "Alpha Value: \(currentAlphaText)"
        setBackgroundColor()
    }
    }

}
