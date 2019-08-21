//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Anthony Gonzalez on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    //MARK: -- IBOutlets
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    
    //MARK: -- Properties
    var currentCrayon: Crayon!
    
    //MARK: --IBActions
    @IBAction func redSliderChanged(_ sender: UISlider) {
        setLabelTextValues()
        setBackgroundColor()
        checkColorReadability()
        
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        setLabelTextValues()
        setBackgroundColor()
        checkColorReadability()
        
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        setLabelTextValues()
        setBackgroundColor()
        checkColorReadability()
    }
    
    @IBAction func alphaStepperPressed(_ sender: UIStepper) {
        setLabelTextValues()
        setBackgroundColor()
        checkColorReadability()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        viewDidLoad()
    }
    
    //MARK: -- Methods
    
    private func setBackgroundColor() {
        let currentCrayonBackgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value) , blue: CGFloat(blueSlider.value), alpha: CGFloat(Float(alphaStepper.value)))
        view.backgroundColor = currentCrayonBackgroundColor
    }
    
    private func setMinMaxColorValues() {
        [redSlider, blueSlider, greenSlider].forEach({$0?.minimumValue = 0.0})
        [redSlider, blueSlider, greenSlider].forEach({$0?.maximumValue = 1.0})
        alphaStepper.minimumValue = 0.0
        alphaStepper.maximumValue = 1.0
    }
    
    private func setLabelTextValues(){
        colorNameLabel.text = currentCrayon.name
        redValueLabel.text = "Red: \(redSlider.value.roundTo(places: 2))"
        greenValueLabel.text = "Green: \(greenSlider.value.roundTo(places: 2))"
        blueValueLabel.text = "Blue: \(blueSlider.value.roundTo(places: 2))"
        alphaValueLabel.text = "Alpha: \(alphaStepper.value.roundTo(places: 2))"
    }
    
    private func darkMode() {
        [colorNameLabel, redValueLabel, greenValueLabel, blueValueLabel, alphaValueLabel].forEach({$0?.textColor = .white})
        [alphaStepper, resetButton, redSlider, greenSlider, blueSlider].forEach({$0?.tintColor = .white})
        resetButton.layer.cornerRadius = resetButton.frame.height / 2
        resetButton.layer.borderColor = UIColor.white.cgColor
        resetButton.layer.borderWidth = 2.0
    }
    
    private func lightMode() {
        [colorNameLabel, redValueLabel, greenValueLabel, blueValueLabel, alphaValueLabel].forEach({$0?.textColor = .black})
        [alphaStepper, resetButton, redSlider, greenSlider, blueSlider].forEach({$0?.tintColor = .black})
        resetButton.layer.cornerRadius = resetButton.frame.height / 2
        resetButton.layer.borderColor = UIColor.black.cgColor
        resetButton.layer.borderWidth = 2.0
    }
    
    private func checkColorReadability() {
        let bgRedValue = view.backgroundColor!.rgba.red
        let bgGreenValue = view.backgroundColor!.rgba.green
        let bgBlueValue = view.backgroundColor!.rgba.blue
        let bgAlphaValue = view.backgroundColor!.rgba.alpha
        
        var alphaIsTooDark = false
        var colorIsTooDark = false
        
        if bgAlphaValue < 0.5 {
            alphaIsTooDark = true
        } else {
            alphaIsTooDark = false
        }
        
        if bgRedValue < 0.3 && bgBlueValue < 0.3 || bgRedValue < 0.3 && bgGreenValue < 0.3 || bgBlueValue < 0.3 && bgGreenValue < 0.3 {
            colorIsTooDark = true
        } else {
            colorIsTooDark = false
        }
        
        switch alphaIsTooDark {
        case true: return darkMode()
        case false:
            switch colorIsTooDark {
            case true: return darkMode()
            case false: return lightMode()
            default: ()
            }
        default: ()
        }
    }
    
    private func setDefaultColorValues() {
        redSlider.value = Float(currentCrayon.red/255)
        greenSlider.value = Float(currentCrayon.green/255)
        blueSlider.value = Float(currentCrayon.blue/255)
        alphaStepper.value = 1.0
    }
    
    private func setResetButtonColor() {
        resetButton.tintColor = .black
        resetButton.layer.cornerRadius = resetButton.frame.height / 2
        resetButton.layer.borderColor = UIColor.black.cgColor
        resetButton.layer.borderWidth = 2.0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMinMaxColorValues()
        setDefaultColorValues()
        setLabelTextValues()
        setBackgroundColor()
        setResetButtonColor()
        checkColorReadability()
    }
}
