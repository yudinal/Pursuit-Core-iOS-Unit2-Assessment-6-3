//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Anthony Gonzalez on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    var currentCrayon: Crayon!
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        setLabelTextValues()
        setBackgroundColor()
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        setLabelTextValues()
        setBackgroundColor()
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        setLabelTextValues()
        setBackgroundColor()
    }
    
    private func setMinMaxColorValues() {
        redSlider.minimumValue = 0.0
        redSlider.maximumValue = 1.0
        blueSlider.minimumValue = 0.0
        blueSlider.maximumValue = 1.0
        greenSlider.minimumValue = 0.0
        greenSlider.maximumValue = 1.0
    }
    
    private func setLabelTextValues(){
        colorNameLabel.text = currentCrayon.name
        redValueLabel.text = "Red: \(redSlider.value)"
        greenValueLabel.text = "Green: \(greenSlider.value)"
        blueValueLabel.text = "Blue: \(blueSlider.value)"
    }
    
    
    private func setDefaultColorValues() {
    redSlider.value = Float(currentCrayon.red/255)
    greenSlider.value = Float(currentCrayon.green/255)
    blueSlider.value = Float(currentCrayon.blue/255)
    }
    
    private func setBackgroundColor() {
        let currentCrayonBackgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value) , blue: CGFloat(blueSlider.value), alpha: 1)
        view.backgroundColor = currentCrayonBackgroundColor
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        viewDidLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMinMaxColorValues()
        setDefaultColorValues()
        setLabelTextValues()
        setBackgroundColor()
    }
    

}
