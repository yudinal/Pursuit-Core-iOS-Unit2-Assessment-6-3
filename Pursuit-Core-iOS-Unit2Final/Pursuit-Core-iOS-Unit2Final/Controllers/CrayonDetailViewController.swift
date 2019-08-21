//
//  CrayonDetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alyson Abril on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CrayonDetailViewController: UIViewController {

    
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaStepper: UIStepper!
    
    var crayon: Crayon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultValues()
        updateLabels()
        
    }
    
    private func updateLabels () {
        redValueLabel.text = "Red:  \(String(format: "%.3f", redSlider.value))"
        greenValueLabel.text = "Green:  \(String(format: "%.3f", greenSlider.value))"
        blueValueLabel.text = "Blue:  \(String(format: "%.3f", blueSlider.value))"
    }
    
    private func updateColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        let alpha = CGFloat(alphaStepper.value)
        
        let color = UIColor(displayP3Red: red, green: green, blue: blue, alpha: alpha)
        view.backgroundColor = color
        updateLabels()
        
    }
    
    private func defaultValues() {
        colorNameLabel.text = crayon.name
        view.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1)
        
        redSlider.value = Float(crayon.red/255)
        greenSlider.value = Float(crayon.green/255)
        blueSlider.value = Float(crayon.blue/255)
        alphaStepper.value = 1
        updateLabels()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateColor()  
    }

    
    @IBAction func stepperPressed(_ sender: UIStepper) {
    
        updateColor()
    }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        sender.backgroundColor = .purple
        sender.setTitleColor(.white, for: .normal)
        defaultValues()
    }
    
}
