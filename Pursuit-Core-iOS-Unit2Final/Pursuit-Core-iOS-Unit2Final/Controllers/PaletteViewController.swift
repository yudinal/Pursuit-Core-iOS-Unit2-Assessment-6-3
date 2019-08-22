//
//  PaletteViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Jack Wong on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class PaletteViewController: UIViewController {
    
    @IBOutlet weak var segmentedCtrl: UISegmentedControl!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var selectedColorLabel: UILabel!
    
    //Text Fields
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    
    //Color Labels
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBOutlet var allLabels: [UILabel]!
    
    
    //Color Sliders
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaStepper: UIStepper!
    
    var crayonChoice: Crayon?
    
    var redValue: Double? {
        didSet { updateEverthing() }
    }
    var greenValue: Double? {
        didSet { updateEverthing() }
    }
    var blueValue: Double? {
        didSet { updateEverthing() }
    }
    var alphaValue: Double? {
        didSet { updateEverthing() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        btnCSS(resetButton)
//        redSlider.thumbTintColor = .red
//        greenSlider.thumbTintColor = .green
//        blueSlider.thumbTintColor = .blue
        setUp()
    }
    
    @IBAction func redValueChanged(_ sender: UISlider) {
        redValue = Double(sender.value)
    }
    
    @IBAction func greenValueChanged(_ sender: UISlider) {
        greenValue = Double(sender.value)
    }
    
    @IBAction func blueValueChanged(_ sender: UISlider) {
        blueValue = Double(sender.value)
    }
    
    @IBAction func alphaValueChanged(_ sender: UIStepper) {
        var stepperValue = alphaStepper.value
        
        //Fix floating point errors
        if Int(stepperValue * 1000) % 10 == 9 {
            stepperValue = Double(Int(stepperValue * 1000) + 1) / 1000
        }
        
        stepperValue = Double(Int(stepperValue * 1000)) / 1000
        
        alphaValue = stepperValue
    }
    
    
    @IBAction func resetPressed(_ sender: UIButton) {
        setUp()
    }
    
    @IBAction func switchBetweenFormats(_ sender: UISegmentedControl) {
        updateEverthing()
    }
    
    func updateEverthing() {
        
        guard let red = redValue, let green = greenValue, let blue = blueValue, let alphaVal = alphaValue  else {
            return
        }
        
        self.view.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alphaVal))
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        alphaStepper.value = alphaVal
        alphaLabel.text = "Alpha: \(alphaStepper.value)"
        
        //If Decimal
        if segmentedCtrl.selectedSegmentIndex == 0 {
            
            redLabel.text = "Red: \(redSlider.value * 255)"
            redTextField.text = "\(redSlider.value * 255)"
            
            greenLabel.text = "Green: \(greenSlider.value * 255)"
            greenTextField.text = "\(greenSlider.value * 255)"
            
            blueLabel.text = "Blue: \(blueSlider.value * 255)"
            blueTextField.text = "\(blueSlider.value * 255)"
        }
            //Hexadecimal
        else{
            //%x is a format specifier that format and output the hex value. Given an Int, it will convert it to hex value
            redLabel.text = "Red: " + String(format: "%02X", Int(redSlider.value * 255))
            redTextField.text = String(format: "%02X", Int(redSlider.value * 255))
            
            greenLabel.text = "Green: " + String(format: "%02X", Int(greenSlider.value * 255))
            greenTextField.text = String(format: "%02X", Int(greenSlider.value * 255))
            
            blueLabel.text = "Blue: " + String(format: "%02X", Int(blueSlider.value * 255))
            blueTextField.text = String(format: "%02X", Int(blueSlider.value * 255))
        }
        
        //Bonus:  Text color is black until the background gets too dark.  Text color would then be white.
        guard (alphaVal < 0.5) || ((red + green + blue) / 3.0 < 0.5) else {
            allLabels.forEach{$0.textColor = UIColor.black}
            resetButton.setTitleColor(UIColor.black, for: .normal)
            resetButton.layer.borderColor = UIColor.black.cgColor
            return
        }
        allLabels.forEach{$0.textColor = UIColor.white}
        resetButton.setTitleColor(UIColor.white, for: .normal)
        resetButton.layer.borderColor = UIColor.white.cgColor
    }
    
    func setUp(){
        if let initialCrayon = crayonChoice{
            
            redValue = initialCrayon.red / 255
            greenValue = initialCrayon.green / 255
            blueValue = initialCrayon.blue / 255
            alphaValue = 1.0
            
            selectedColorLabel.text = initialCrayon.name
        }
    }
    
}

extension PaletteViewController: UITextFieldDelegate{
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        if segmentedCtrl.selectedSegmentIndex == 0 {
            
            switch textField.tag{
            case 0:
                redValue = (textField.text?.isEmpty)! ? 0 : Double(textField.text!)! / 255
            case 1:
                greenValue = (textField.text?.isEmpty)! ? 0 : Double(textField.text!)! / 255
            case 2:
                blueValue = (textField.text?.isEmpty)! ? 0 : Double(textField.text!)! / 255
            default:
                print("My ass")
            }
        }
        else{
            
            switch textField.tag {
                /*
                 Use  UInt(text, radix: 16)!
                 where text is the ASCII representation of a number in the radix passed as radix and
                 The radix, or base, to use for converting text to an integer value. radix must be in the range 2...36. The default is 10.
                 However since the goal is to use hexadecimals, we use 16.
                 */
            case 0:
                redValue = (textField.text?.isEmpty)! ? 0 : (Double(UInt(textField.text!, radix:16)!) / 255)
            case 1:
                greenValue = (textField.text?.isEmpty)! ? 0 : (Double(UInt(textField.text!, radix:16)!) / 255)
            case 2:
                blueValue = (textField.text?.isEmpty)! ? 0 : (Double(UInt(textField.text!, radix:16)!) / 255)
            default: print("something went wrong")
            }
            
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if segmentedCtrl.selectedSegmentIndex == 0{
            
            guard string != "" else {
                return true
            }

            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }

            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
       
            guard Double(updatedText) != nil && Double(updatedText)! <= 255.0 else {
                return false
            }
            
        }else{
            
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            let regExPattern = "^[A-Fa-f0-9]*$"
            let doesItMatch = updatedText.range(of: regExPattern, options: .regularExpression) != nil
            
            return doesItMatch && updatedText.count <= 2
            
        }
        
        return true
    }
    
}
