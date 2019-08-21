//
//  DetailsViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Sunni Tang on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    // MARK: - Variables and constants
    
    // Label outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    // Slider outlets
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    // Stepper outlet
    @IBOutlet weak var alphaStepper: UIStepper!
    
    // Instance of class Crayon
    var currentCrayon: Crayon?
    
    // Color value variables
    var currentRedValue: CGFloat = 1.0
    var currentGreenValue: CGFloat = 1.0
    var currentBlueValue: CGFloat = 1.0
    var currentAlphaValue: CGFloat = 1.0
    let defaultAlphaValue = Crayon.defaultAlpha
    
    // Color value variables to be displayed on labels
    var currentRedForText: CGFloat = 1.0
    var currentGreenForText: CGFloat = 1.0
    var currentBlueForText: CGFloat = 1.0
    var currentAlphaForText: CGFloat = 1.0
    
    
    // MARK: - Life cycle functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialDetails()
    }
    
    
    // MARK: - UI Functions
    // Func to change RGB values based on which slider is used
    @IBAction func sliderChangeValue(_ sender: UISlider) {
        if let currentCrayon = currentCrayon {
            switch sender.tag {
                case 0:
                    currentRedValue = CGFloat(sender.value)
                    currentRedForText = currentCrayon.roundValuesForLabel(value: currentRedValue)
                    redLabel?.text = "Red Value: \(currentRedForText)"
                case 1:
                    currentGreenValue = CGFloat(sender.value)
                    currentGreenForText = currentCrayon.roundValuesForLabel(value: currentGreenValue)
                    greenLabel?.text = "Green Value: \(currentGreenForText)"
                case 2:
                    currentBlueValue = CGFloat(sender.value)
                    currentBlueForText = currentCrayon.roundValuesForLabel(value: currentBlueValue)
                    blueLabel?.text = "Blue Value: \(currentBlueForText)"
                default:
                    fatalError("No slider was used")
            }
            setBackgroundColor()
        }
    }
    
    // Func to change alpha value based on stepper
    @IBAction func stepperChangeValue(_ sender: UIStepper) {
        if let currentCrayon = currentCrayon {
            currentAlphaValue = CGFloat(sender.value)
            currentAlphaForText = currentCrayon.roundValuesForLabel(value: currentAlphaValue)
            alphaLabel?.text = "Alpha Value: \(currentAlphaForText)"
            
            setBackgroundColor()
        }
    }
    
    // Func to reset RGBa values to original details
    @IBAction func pressButtonReset(_ sender: UIButton) {
        setInitialDetails()
    }
    
    
    // MARK: - Backend functions
    
    // Func to set initial details based on the selected crayon
    func setInitialDetails() {
        if let currentCrayon = currentCrayon {
            self.nameLabel?.text = currentCrayon.name
            
            currentRedValue = currentCrayon.convertCrayonValue(value: currentCrayon.red)
            redSlider.value = Float(currentRedValue)
            currentRedForText = currentCrayon.roundValuesForLabel(value: currentRedValue)
            redLabel?.text = "Red Value: \(currentRedForText)"
            
            currentGreenValue = currentCrayon.convertCrayonValue(value: currentCrayon.green)
            greenSlider.value = Float(currentGreenValue)
            currentGreenForText = currentCrayon.roundValuesForLabel(value: currentGreenValue)
            greenLabel?.text = "Green Value: \(currentGreenForText)"
            
            currentBlueValue = currentCrayon.convertCrayonValue(value: currentCrayon.blue)
            blueSlider.value = Float(currentBlueValue)
            currentBlueForText = currentCrayon.roundValuesForLabel(value: currentBlueValue)
            blueLabel?.text = "Blue Value: \(currentBlueForText)"
            
            currentAlphaValue = defaultAlphaValue
            currentAlphaForText = currentCrayon.roundValuesForLabel(value: currentAlphaValue)
            alphaLabel?.text = "Alpha Value: \(currentAlphaForText)"
            
            setBackgroundColor()
        }
    }
    
    // Func to set the background color based on current RGB values
    func setBackgroundColor() {
        self.view.backgroundColor = UIColor(red: currentRedValue, green: currentGreenValue, blue: currentBlueValue, alpha: currentAlphaValue)
    }
}
