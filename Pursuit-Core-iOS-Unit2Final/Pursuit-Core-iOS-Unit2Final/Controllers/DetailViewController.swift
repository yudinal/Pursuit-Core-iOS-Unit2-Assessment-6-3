//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Angela Garrovillas on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var crayon: Crayon!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaStepper: UIStepper!
    
    @IBAction func sliderSlides(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            redTextField.text = ""
        case 1:
            greenTextField.text = ""
        case 2:
            blueTextField.text = ""
        default:
            print("check")
        }
        updateViewBackground()
    }
    @IBAction func stepperTapped(_ sender: UIStepper) {
        updateViewBackground()
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        redTextField.text = ""
        greenTextField.text = ""
        blueTextField.text = ""
        resetValues()
    }
    
    @IBAction func typedInValue(_ sender: UITextField) {
        guard let unwrap = sender.text, let value = Float(unwrap) else {return print("not going through")}
        switch sender.tag {
        case 0:
            redSlider.value = value
        case 1:
            greenSlider.value = value
        case 2:
            blueSlider.value = value
        default:
            updateViewBackground()
        }
        updateViewBackground()
    }
    
    private func updateViewBackground() {
        let newColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaStepper.value))
        self.view.backgroundColor = newColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        crayon.delegate = self
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        crayon.delegate?.resetValues()
        self.view.backgroundColor = crayon.getUIColor()

        // Do any additional setup after loading the view.
    }
}

extension DetailViewController: UIColorable {
    var defaultRed: Float {return Float(crayon.red/255)}
    var defaultGreen: Float {return Float(crayon.green/255)}
    var defaultBlue: Float {return Float(crayon.blue/255)}
    var defaultAlpha: Double {return 1}

    func resetValues() {
        nameLabel.text = crayon.name
        redSlider.value = defaultRed
        greenSlider.value = defaultGreen
        blueSlider.value = defaultBlue
        alphaStepper.value = 1
        updateViewBackground()
    }
}

extension DetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        updateViewBackground()
        return true
    }
}
