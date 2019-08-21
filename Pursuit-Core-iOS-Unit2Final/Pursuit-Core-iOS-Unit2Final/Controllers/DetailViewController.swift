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
        updateBackgroundColor()
        if istooDark() == true {
            changeColor(color: UIColor.white)
        } else {
            changeColor(color: UIColor.black)
        }
        
        
    }
    
    @IBAction func greenSliderTouched(_ sender: UISlider) {
        backgroundColor.changeGreen(green: CGFloat(sender.value))
        greenValueLabel.text = "Green Value: \(sender.value.roundTo(places: 2))"
        updateBackgroundColor()
        if istooDark() == true {
            changeColor(color: UIColor.white)
        } else {
            changeColor(color: UIColor.black)
        }
    }
    
    @IBAction func blueSliderTouched(_ sender: UISlider) {
        backgroundColor.changeBlue(blue: CGFloat(sender.value))
        blueValueLabel.text = "Blue Value: \(sender.value.roundTo(places: 2))"
        updateBackgroundColor()
        if istooDark() == true {
            changeColor(color: UIColor.white)
        } else {
            changeColor(color: UIColor.black)
        }
    }
    
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        backgroundColor.changeAlpha(alpha: CGFloat(sender.value))
        alphaValueLabel.text = "Alpha Value: \(sender.value.roundTo(places: 2))"
        updateBackgroundColor()
        if istooDark() == true {
            changeColor(color: UIColor.white)
        } else {
            changeColor(color: UIColor.black)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialValues()
    }
    

    
    func updateBackgroundColor() {
        self.view.backgroundColor = backgroundColor.getColor()
    }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        setInitialValues()
    }
    
    func setInitialValues() {
        backgroundColor = Color(red: CGFloat(crayon.red/255)
        , green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1)
        
        if self.view.backgroundColor == UIColor(red: 0, green: 0, blue: 0, alpha: 1) {
            changeColor(color: UIColor.white)
        }
        
        colorNameLabel.text = crayon.name
        redValueLabel.text = "Red Value: \((crayon.red/255).roundTo(places: 2))"
        blueValueLabel.text = "Blue Value: \((crayon.blue/255).roundTo(places: 2))"
        greenValueLabel.text = "Blue Value: \((crayon.green/255).roundTo(places: 2))"
        alphaValueLabel.text = "Alpha Value: 1"
        redSlider.value = Float(crayon.red/255).roundTo(places: 2)
        greenSlider.value = Float(crayon.green/255).roundTo(places: 2)
        blueSlider.value = Float(crayon.blue/255).roundTo(places: 2)
       
        
    }
    
    func changeColor(color: UIColor) {
        colorNameLabel.textColor = color
        redValueLabel.textColor = color
        blueValueLabel.textColor = color
        greenValueLabel.textColor = color
        alphaValueLabel.textColor = color
    }
    
    func istooDark() -> Bool {
        if alphaStepper.value < 0.5 {
            return true
        } else if redSlider.value < 0.3 && blueSlider.value < 0.3 && greenSlider.value < 0.3 {
            return true
        }
        
        return false
    }
    

}
