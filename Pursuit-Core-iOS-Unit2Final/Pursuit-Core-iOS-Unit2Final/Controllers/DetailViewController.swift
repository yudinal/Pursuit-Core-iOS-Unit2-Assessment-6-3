//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Anthony on 8/21/19.
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
    var currentCrayon: Crayon! //Passed from VC Segue
    
    //MARK: --IBActions
    @IBAction func slidersAdjusted(_ sender: UISlider) {
        setLabelTextValues()
        setBackgroundColor()
        checkReadability()
    }
    
    @IBAction func alphaStepperPressed(_ sender: UIStepper) {
        setLabelTextValues()
        setBackgroundColor()
        checkReadability()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        viewDidLoad()
    }
    
    //MARK: -- Methods
    private func setMinMaxColorValues() {
        [redSlider, blueSlider, greenSlider].forEach({$0?.minimumValue = 0.0})
        [redSlider, blueSlider, greenSlider].forEach({$0?.maximumValue = 1.0})
        alphaStepper.minimumValue = 0.0
        alphaStepper.maximumValue = 1.0
    }
    
    private func setDefaultColorValues() {
        redSlider.value = Float(currentCrayon.red/255)
        greenSlider.value = Float(currentCrayon.green/255)
        blueSlider.value = Float(currentCrayon.blue/255)
        alphaStepper.value = 1.0
    }
    
    private func setLabelTextValues(){
        colorNameLabel.text = currentCrayon.name
        redTextField.text = "\(redSlider.value.roundTo(places: 2))"
        blueTextField.text = "\(blueSlider.value.roundTo(places: 2))"
        greenTextField.text = "\(greenSlider.value.roundTo(places: 2))"
        alphaValueLabel.text = "Alpha: \(alphaStepper.value.roundTo(places: 2))"
    }
    
    private func setBackgroundColor() {
        let currentCrayonBackgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value) , blue: CGFloat(blueSlider.value), alpha: CGFloat(Float(alphaStepper.value)))
        view.backgroundColor = currentCrayonBackgroundColor
    }
    
    private func darkMode() {
        [colorNameLabel, alphaValueLabel, redLabel, greenLabel, blueLabel].forEach({$0?.textColor = .white})
        [alphaStepper, resetButton, redSlider, greenSlider, blueSlider].forEach({$0?.tintColor = .white})
        resetButton.layer.cornerRadius = resetButton.frame.height / 2
        resetButton.layer.borderColor = UIColor.white.cgColor
        resetButton.layer.borderWidth = 1.0
    }
    
    private func lightMode() {
        [colorNameLabel, alphaValueLabel, redLabel, greenLabel, blueLabel].forEach({$0?.textColor = .black})
        [alphaStepper, resetButton, redSlider, greenSlider, blueSlider].forEach({$0?.tintColor = .black})
        resetButton.layer.cornerRadius = resetButton.frame.height / 2
        resetButton.layer.borderColor = UIColor.black.cgColor
        resetButton.layer.borderWidth = 1.0
    }
    
    private func checkReadability() {
        let bgRedValue = redSlider.value
        let bgGreenValue = greenSlider.value
        let bgBlueValue = blueSlider.value
        let bgAlphaValue = alphaStepper.value
        
        var alphaIsTooDark = false
        var colorMakesTextUnreadable = false
        
        if bgAlphaValue < 0.5 {
            alphaIsTooDark = true
        } else {
            alphaIsTooDark = false
        }
        
        if bgRedValue < 0.3 && bgBlueValue < 0.3 || bgRedValue < 0.3 && bgGreenValue < 0.3 || bgBlueValue < 0.3 && bgGreenValue < 0.3 {
            colorMakesTextUnreadable = true
        } else {
            colorMakesTextUnreadable = false
        }
        
        switch alphaIsTooDark {
        case true: darkMode()
        case false:
            switch colorMakesTextUnreadable {
            case true: darkMode()
            case false: lightMode()
            }
        }
        if bgRedValue < 0.3 && bgBlueValue < 0.3 && bgGreenValue > 0.7 {
            lightMode()
        }
    }
    
    private func configureViewDelegates() {
        redTextField.delegate = self
        blueTextField.delegate = self
        greenTextField.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMinMaxColorValues()
        setDefaultColorValues()
        setLabelTextValues()
        setBackgroundColor()
        checkReadability()
        configureViewDelegates()
    }
}

//MARK: -- Textfield Delegate Methods
extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            if let redTextFieldFloat = textField.text?.toFloat() {
                let currentColor = UIColor(displayP3Red: CGFloat(redTextFieldFloat), green: CGFloat(greenSlider.value) , blue: CGFloat(blueSlider.value), alpha: CGFloat(Float(alphaStepper.value)))
                view.backgroundColor = currentColor
                redSlider.value = redTextFieldFloat
                checkReadability()
            }
            
        case 1:
            if let greenTextFieldFloat = textField.text?.toFloat() {
                let currentColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenTextFieldFloat) , blue: CGFloat(blueSlider.value), alpha: CGFloat(Float(alphaStepper.value)))
                view.backgroundColor = currentColor
                greenSlider.value = greenTextFieldFloat
                checkReadability()
            }
            
        case 2:
            if let blueTextFieldFloat = textField.text?.toFloat() {
                let currentColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value) , blue: CGFloat(blueTextFieldFloat), alpha: CGFloat(Float(alphaStepper.value)))
                view.backgroundColor = currentColor
                blueSlider.value = Float(blueTextFieldFloat)
                checkReadability()
            }
            
        default: ()
        }
        
        textField.resignFirstResponder()
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
