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
    var currentAlpha: CGFloat = 1.0
    let defaultAlpha = Crayon.defaultAlpha
    
    // Color value variables to be displayed on labels
    var currentRedText: CGFloat = 1.0
    var currentGreenText: CGFloat = 1.0
    var currentBlueText: CGFloat = 1.0
    var currentAlphaText: CGFloat = 1.0
    
    
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
    
    // Func to change alpha value based on stepper
    @IBAction func stepperChangeValue(_ sender: UIStepper) {
        if let currentCrayon = currentCrayon {
            currentAlpha = CGFloat(sender.value)
            currentAlphaText = currentCrayon.roundValuesForLabel(value: currentAlpha)
            alphaLabel?.text = "Alpha Value: \(currentAlphaText)"
            
            setBackgroundColor()
        }
    }
    
    
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
            
            currentAlpha = defaultAlpha
            currentAlphaText = currentCrayon.roundValuesForLabel(value: currentAlpha)
            alphaLabel?.text = "Alpha Value: \(currentAlphaText)"
            
            setBackgroundColor()
        }
    }
    
    // Func to set the background color based on current RGB values
    func setBackgroundColor() {
        self.view.backgroundColor = UIColor(red: currentRedValue, green: currentGreenValue, blue: currentBlueValue, alpha: currentAlpha)
    }
}
