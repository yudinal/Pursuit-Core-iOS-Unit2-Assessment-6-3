//
//  ColorDetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Levi Davis on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit


class ColorDetailViewController: UIViewController {
    var crayon: Crayon!
    
    @IBOutlet weak var crayonColorLabel: UILabel!
    @IBOutlet weak var redSliderLabel: UILabel!
    @IBOutlet weak var greenSliderLabel: UILabel!
    @IBOutlet weak var blueSliderLabel: UILabel!
    @IBOutlet weak var alphaStepperLabel: UILabel!
    
    @IBOutlet weak var redSliderOutlet: UISlider!
    @IBOutlet weak var greenSliderOutlet: UISlider!
    @IBOutlet weak var blueSliderOutlet: UISlider!
    @IBOutlet weak var alphaStepperOutlet: UIStepper!
    
    @IBAction func redSlider(_ sender: UISlider) {
        view.backgroundColor = UIColor(red: CGFloat(sender.value), green: crayon.green, blue: crayon.blue, alpha: crayon.alpha)
        updateColor()
    }
    
    @IBAction func greenSlider(_ sender: UISlider) {
        view.backgroundColor = UIColor(red: crayon.red, green: CGFloat(sender.value), blue: crayon.blue, alpha: crayon.alpha)
        updateColor()
    }
    
    @IBAction func blueSlider(_ sender: UISlider) {
        view.backgroundColor = UIColor(red: crayon.red, green: crayon.green, blue: CGFloat(sender.value), alpha: crayon.alpha)
        updateColor()
    }
    
    @IBAction func alphaStepper(_ sender: UIStepper) {
        view.backgroundColor = UIColor(red: crayon.red, green: crayon.green, blue: crayon.blue, alpha: CGFloat(sender.value))
        updateColor()
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        resetSettings()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelTextColor()
        setInitalSliderPositions()
        setColorLabel()
        setInitialColor()
    }
    
    private func setInitialColor() {
        view.backgroundColor = UIColor(red: crayon.red, green: crayon.green, blue: crayon.blue, alpha: crayon.alpha)
    }
    
    private func setColorLabel() {
        crayonColorLabel.text = crayon.name
        if crayon.name == "Black" {
            crayonColorLabel.textColor = .white
        } else {
            crayonColorLabel.textColor = .black
        }
    }
    
    private func updateColor() {
    view.backgroundColor = UIColor(red: CGFloat(redSliderOutlet.value), green: CGFloat(greenSliderOutlet.value), blue: CGFloat(blueSliderOutlet.value), alpha: CGFloat(alphaStepperOutlet.value))
    }
    
    private func resetSettings() {
        setInitialColor()
        setInitalSliderPositions()
    }
    
    private func setLabelTextColor() {
        if crayon.name == "Black" {
            redSliderLabel.textColor = .white
            greenSliderLabel.textColor = .white
            blueSliderLabel.textColor = .white
            alphaStepperLabel.textColor = .white
        } else {
            redSliderLabel.textColor = .black
            greenSliderLabel.textColor = .black
            blueSliderLabel.textColor = .black
            alphaStepperLabel.textColor = .black
        }
    }
    
    private func setInitalSliderPositions() {
        redSliderOutlet.value = Float(crayon.red)
        greenSliderOutlet.value = Float(crayon.green)
        blueSliderOutlet.value = Float(crayon.blue)
        alphaStepperOutlet.value = Double(crayon.alpha)
    }
    
}
