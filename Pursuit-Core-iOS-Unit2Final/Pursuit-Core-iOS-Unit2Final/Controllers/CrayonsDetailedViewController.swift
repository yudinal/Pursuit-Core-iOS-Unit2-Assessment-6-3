//
//  CrayonsDetailedViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Mariel Hoepelman on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.

import UIKit

class CrayonsDetailedViewController: UIViewController {
    
    var crayon: Crayon!
    
    @IBOutlet weak var selectedCrayonNameLabel: UILabel!
    @IBOutlet weak var currentRedValueLabel: UILabel!
    @IBOutlet weak var currentGreenValueLabel: UILabel!
    @IBOutlet weak var currentBlueValueLabel: UILabel!
    @IBOutlet weak var currentAlphaValueLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var originalRed = 0.0
    var originalGreen = 0.0
    var originalBlue = 0.0
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            crayon.red = Double(CGFloat(sender.value * 255))
            changeLabeltext(label: currentRedValueLabel, color: "red", value: sender.value)
            viewBackgroundColor()
        case 1:
            crayon.green = Double(CGFloat(sender.value * 255))
            changeLabeltext(label: currentGreenValueLabel, color: "green", value: sender.value)
            viewBackgroundColor()
        case 2:
            crayon.blue = Double(CGFloat(sender.value * 255))
            changeLabeltext(label: currentBlueValueLabel, color: "blue", value: sender.value)
            viewBackgroundColor()
        default:
            print("")
        }
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: CGFloat(sender.value))
        currentAlphaValueLabel.text = String("Current value of alpha: \(sender.value)")
    }
    
    private func viewBackgroundColor() -> Void {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1.0)
    }
//
//    private func updateBackground() {
//        let backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(stepper.value))
//    }
 
    @IBAction func resetViewToOriginal(_ sender: UIButton) {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(originalRed/255), green: CGFloat(originalGreen/255), blue: CGFloat(originalBlue/255), alpha: 1.0)
        resetSliders()
        setLabels()
    }
    
    private func setLabels() {
        currentRedValueLabel.text = String("Current value of red: \(originalRed/255)")
        currentGreenValueLabel.text = String("Current value of green: \(originalGreen/255)")
        currentBlueValueLabel.text = String("Current value of blue: \(originalBlue/255)")
        currentAlphaValueLabel.text = "Current value of alpha is 1"
    }
    
    private func resetSliders() {
        redSlider.value = Float(originalRed)/255
        greenSlider.value = Float(originalGreen)/255
        blueSlider.value = Float(originalBlue)/255
    }
    
    private func changeLabeltext(label: UILabel, color: String, value: Float) -> Void {
    label.text = String("Current value of \(color): \(value)")
    }
    
    private func setSliders() -> Void {
        redSlider.value = Float(crayon.red/255)
        greenSlider.value = Float(crayon.green/255)
        blueSlider.value = Float(crayon.blue/255)
    }
    
    override func viewDidLoad() {
        viewBackgroundColor()
        selectedCrayonNameLabel.text = crayon.name
        originalRed = crayon.red
        originalGreen = crayon.green
        originalBlue = crayon.blue
        setSliders()
        setLabels()
    }

}
