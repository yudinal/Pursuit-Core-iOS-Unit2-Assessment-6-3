//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Michelle Cueva on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var backgroundColor: Color!{
        didSet {
            self.updateBackgroundColor()
            if self.view.backgroundColor == Crayon.getBlack() {
                changeColor(color: UIColor.white)
            }
        }
    }

    var crayon: Crayon!

    
    @IBOutlet weak var colorNameLabel: UILabel!
    
    @IBOutlet weak var redValueLabel: UILabel!
    
    @IBOutlet weak var greenValueLabel: UILabel!
    
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var alphaValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var alphaStepper: UIStepper!
    
    
    @IBAction func redSliderTouched(_ sender: UISlider) {
        backgroundColor.changeRed(red: CGFloat(sender.value))
        redValueLabel.text = "Red Value: \(sender.value.roundTo(places: 2))"
        updateLabelColors()
    }
    
    @IBAction func greenSliderTouched(_ sender: UISlider) {
        backgroundColor.changeGreen(green: CGFloat(sender.value))
        greenValueLabel.text = "Green Value: \(sender.value.roundTo(places: 2))"
        updateLabelColors()
    }
    
    @IBAction func blueSliderTouched(_ sender: UISlider) {
        backgroundColor.changeBlue(blue: CGFloat(sender.value))
        blueValueLabel.text = "Blue Value: \(sender.value.roundTo(places: 2))"
        updateLabelColors()
    }
    
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        backgroundColor.changeAlpha(alpha: CGFloat(sender.value))
        alphaValueLabel.text = "Alpha Value: \(sender.value.roundTo(places: 2))"
        updateLabelColors()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialValues()
    }

    func updateBackgroundColor() {
        self.view.backgroundColor = backgroundColor.getColor()
    }
    
    
    func updateLabelColors() {
        let colorChoice = istooDark() ? UIColor.white : UIColor.black
        changeColor(color: colorChoice)
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        setInitialValues()
    }
    
    func istooDark() -> Bool {
        if alphaStepper.value < 0.5 {
            return true
        } else if redSlider.value < 0.4 && blueSlider.value < 0.5 && greenSlider.value < 0.4 {
            return true
        }
        
        return false
    }
    
    func changeColor(color: UIColor) {
        colorNameLabel.textColor = color
        redValueLabel.textColor = color
        blueValueLabel.textColor = color
        greenValueLabel.textColor = color
        alphaValueLabel.textColor = color
    }
    
    func setInitialValues() {
        backgroundColor = crayon.getColor()
        setInitialLabelValues()
        setInitialSliderValues()
    }
    
    func setInitialLabelValues() {
        redValueLabel.text = crayon.redValueInString()
        blueValueLabel.text = crayon.blueValueInString()
        greenValueLabel.text = crayon.blueValueInString()
        colorNameLabel.text = crayon.name
        alphaValueLabel.text = "Alpha Value: 1"
    }
    
    func setInitialSliderValues() {
        redSlider.value = crayon.redValueInFloat()
        greenSlider.value = crayon.greenValueInFloat()
        blueSlider.value = crayon.blueValueInFloat()
    }
    
}
