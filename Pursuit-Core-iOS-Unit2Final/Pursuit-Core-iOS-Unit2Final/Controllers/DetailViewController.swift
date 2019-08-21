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
    @IBOutlet weak var alphaValueLabel: UILabel!
  
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    //MARK: -- Properties
    var currentCrayon: Crayon!
    
    //MARK: --IBActions
    @IBAction func slidersAdjusted(_ sender: UISlider) {
        switch sender.tag {
        case 0: //Red Slider
            setLabelTextValues()
            setBackgroundColor()
            checkColorReadability()
        case 1: //Green Slider
            setLabelTextValues()
            setBackgroundColor()
            checkColorReadability()
        case 2: //Blue Slider
            setLabelTextValues()
            setBackgroundColor()
            checkColorReadability()
        default: ()
        }
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
        redTextField.text = "\(redSlider.value.roundTo(places: 2))"
        blueTextField.text = "\(blueSlider.value.roundTo(places: 2))"
        greenTextField.text = "\(greenSlider.value.roundTo(places: 2))"
        alphaValueLabel.text = "Alpha: \(alphaStepper.value.roundTo(places: 2))"
    }
    
    private func darkMode() {
        [colorNameLabel, alphaValueLabel, redLabel, greenLabel, blueLabel].forEach({$0?.textColor = .white})
        [alphaStepper, resetButton, redSlider, greenSlider, blueSlider].forEach({$0?.tintColor = .white})
        resetButton.layer.cornerRadius = resetButton.frame.height / 2
        resetButton.layer.borderColor = UIColor.white.cgColor
        resetButton.layer.borderWidth = 2.0
    }
    
    private func lightMode() {
        [colorNameLabel, alphaValueLabel, redLabel, greenLabel, blueLabel].forEach({$0?.textColor = .black})
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
        redTextField.delegate = self
        blueTextField.delegate = self
        greenTextField.delegate = self
    }
}

//MARK: -- Textfield Delegate Methods
extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            if let redTextFieldString = textField.text {
                let redTextFieldDouble = redTextFieldString.toDouble()
                if let redTextFieldDouble = redTextFieldDouble {
                    let currentCrayonBackgroundColor = UIColor(displayP3Red: CGFloat(redTextFieldDouble), green: CGFloat(greenSlider.value) , blue: CGFloat(blueSlider.value), alpha: CGFloat(Float(alphaStepper.value)))
                    view.backgroundColor = currentCrayonBackgroundColor
                    redSlider.value = Float(redTextFieldDouble)
                    checkColorReadability()
                }
            }
            
        case 1:
            if let greenTextFieldString = textField.text {
                let greenTextFieldDouble = greenTextFieldString.toDouble()
                if let greenTextFieldDouble = greenTextFieldDouble {
                    let currentCrayonBackgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenTextFieldDouble) , blue: CGFloat(blueSlider.value), alpha: CGFloat(Float(alphaStepper.value)))
                    view.backgroundColor = currentCrayonBackgroundColor
                    greenSlider.value = Float(greenTextFieldDouble)
                    checkColorReadability()
                }
            }
            
        case 2:
            if let blueTextFieldString = textField.text {
                let blueTextFieldDouble = blueTextFieldString.toDouble()
                if let blueTextFieldDouble = blueTextFieldDouble {
                    let currentCrayonBackgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value) , blue: CGFloat(blueTextFieldDouble), alpha: CGFloat(Float(alphaStepper.value)))
                    view.backgroundColor = currentCrayonBackgroundColor
                    blueSlider.value = Float(blueTextFieldDouble)
                    checkColorReadability()
                }
            }
            
        default: ()
        }
        return true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let aSet = NSCharacterSet(charactersIn:".0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        
        if string == numberFiltered {
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            return updatedText.count <= 4
        } else {
            return false
        }
    }
    
}
