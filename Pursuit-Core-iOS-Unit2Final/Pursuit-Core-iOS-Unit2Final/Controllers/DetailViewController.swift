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
        redValueLabel.text = "Red: \(sender.value)"
        view.backgroundColor = UIColor(displayP3Red: CGFloat(sender.value), green: CGFloat(greenSlider.value) , blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        greenValueLabel.text = "Green: \(sender.value)"
         view.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(sender.value) , blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        blueValueLabel.text = "Blue: \(sender.value)"
         view.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value) , blue: CGFloat(sender.value), alpha: 1)
    }
    
    private func setMinMaxColorValues() {
        redSlider.minimumValue = 0.0
        redSlider.maximumValue = 1.0
        blueSlider.minimumValue = 0.0
        blueSlider.maximumValue = 1.0
        greenSlider.minimumValue = 0.0
        greenSlider.maximumValue = 1.0
    }
    
    private func setUpCurrentColorStats(){
        colorNameLabel.text = currentCrayon.name
        
        redSlider.value = Float(currentCrayon.red/255)
        redValueLabel.text = "Red: \(redSlider.value)"
        
        greenSlider.value = Float(currentCrayon.green/255)
        greenValueLabel.text = "Green: \(greenSlider.value)"
        
        blueSlider.value = Float(currentCrayon.blue/255)
        blueValueLabel.text = "Blue: \(blueSlider.value)"
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
        setUpCurrentColorStats()
        setBackgroundColor()
    }
    

}
