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
    
    func formatValues() {
        if let currentCrayon = currentCrayon {

        currentRedValue = currentCrayon.convertCrayonValue(value: currentCrayon.red)
        currentGreenValue = currentCrayon.convertCrayonValue(value: currentCrayon.green)
        currentBlueValue = currentCrayon.convertCrayonValue(value: currentCrayon.blue)
            
        currentRedText = currentCrayon.roundValuesForLabel(value: currentRedValue)
        currentGreenText = currentCrayon.roundValuesForLabel(value: currentGreenValue)
        currentBlueText = currentCrayon.roundValuesForLabel(value: currentBlueValue)
        currentAlphaText = currentCrayon.roundValuesForLabel(value: currentAlpha)
        }
    }
    
    func setInitialDetails() {

        if let currentCrayon = currentCrayon {
            self.nameLabel?.text = currentCrayon.name
            
            currentRedValue = currentCrayon.convertCrayonValue(value: currentCrayon.red)
            redSlider.value = Float(currentRedValue)
            currentRedText = currentCrayon.roundValuesForLabel(value: currentRedValue)
            redLabel?.text = "Red Value: \(currentRedText)"
            
            currentGreenValue = currentCrayon.convertCrayonValue(value: currentCrayon.green)
            greenSlider.value = Float(currentGreenValue)
            currentGreenText = currentCrayon.roundValuesForLabel(value: currentGreenValue)
            greenLabel?.text = "Green Value: \(currentGreenText)"
            
            currentBlueValue = currentCrayon.convertCrayonValue(value: currentCrayon.blue)
            blueSlider.value = Float(currentBlueValue)
            currentBlueText = currentCrayon.roundValuesForLabel(value: currentBlueValue)
            blueLabel?.text = "Blue Value: \(currentBlueText)"
            
            currentAlphaText = currentCrayon.roundValuesForLabel(value: currentAlpha)
            alphaLabel?.text = "Alpha Value: \(currentAlphaText)"
            
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
                    currentRedText = currentCrayon.roundValuesForLabel(value: currentRedValue)
                    redLabel?.text = "Red Value: \(currentRedText)"
                case 1:
                    currentGreenValue = CGFloat(sender.value)
                    currentGreenText = currentCrayon.roundValuesForLabel(value: currentGreenValue)
                    greenLabel?.text = "Green Value: \(currentGreenText)"
                case 2:
                    currentBlueValue = CGFloat(sender.value)
                    currentBlueText = currentCrayon.roundValuesForLabel(value: currentBlueValue)
                    blueLabel?.text = "Blue Value: \(currentBlueText)"
                default:
                    fatalError("No slider was used")
            }
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
