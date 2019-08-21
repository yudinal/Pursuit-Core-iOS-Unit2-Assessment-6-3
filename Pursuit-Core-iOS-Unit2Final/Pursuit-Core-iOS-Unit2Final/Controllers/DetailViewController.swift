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
    @IBOutlet weak var resetButtonOutlet: UIButton!
    
    
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
        checkAlphaReadibility()
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
        redSlider.minimumValue = 0.0
        redSlider.maximumValue = 1.0
        blueSlider.minimumValue = 0.0
        blueSlider.maximumValue = 1.0
        greenSlider.minimumValue = 0.0
        greenSlider.maximumValue = 1.0
        alphaStepper.minimumValue = 0.0
        alphaStepper.maximumValue = 1.0
    }
    
    private func setLabelTextValues(){
        colorNameLabel.text = currentCrayon.name
        redValueLabel.text = "Red: \(redSlider.value)"
        greenValueLabel.text = "Green: \(greenSlider.value)"
        blueValueLabel.text = "Blue: \(blueSlider.value)"
        alphaValueLabel.text = "Alpha: \(alphaStepper.value)"
    }
    
    private func lightMode() {
        colorNameLabel.textColor = .white
        redValueLabel.textColor = .white
        greenValueLabel.textColor = .white
        blueValueLabel.textColor = .white
        alphaValueLabel.textColor = .white
        alphaStepper.tintColor = .white
        resetButtonOutlet.layer.cornerRadius = resetButtonOutlet.frame.height / 2
        resetButtonOutlet.layer.borderColor = UIColor.white.cgColor
        resetButtonOutlet.layer.borderWidth = 2.0
    }
    
    private func darkMode() {
        colorNameLabel.textColor = .black
        redValueLabel.textColor = .black
        greenValueLabel.textColor = .black
        blueValueLabel.textColor = .black
        alphaValueLabel.textColor = .black
        alphaStepper.tintColor = .black
    }
    
    private func checkColorReadability() {
        if Double(redSlider.value) < 0.3 && Double(greenSlider.value) < 0.3 && Double(blueSlider.value) < 0.3 {
            lightMode()
        } else {
            darkMode()
        }
    }
    
    private func checkAlphaReadibility() {
        if alphaStepper.value < 0.5 {
            lightMode()
        } else {
            darkMode()
        }
    }
    
    private func setDefaultColorValues() {
    redSlider.value = Float(currentCrayon.red/255)
    greenSlider.value = Float(currentCrayon.green/255)
    blueSlider.value = Float(currentCrayon.blue/255)
    alphaStepper.value = 1.0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMinMaxColorValues()
        setDefaultColorValues()
        setLabelTextValues()
        setBackgroundColor()
    }
}
