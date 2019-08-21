//
//  ColorDetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Kevin Natera on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
import UIKit

class ColorDetailViewController : UIViewController {
    
    var color: Crayon!
    
    @IBOutlet weak var colorNameLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var greenLabel: UILabel!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var alphaStepper: UIStepper!
    
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        redSlider.value = Float(color.red/255)
        greenSlider.value = Float(color.green/255)
        blueSlider.value = Float(color.blue/255)
        alphaStepper.value = 1.0
        redLabel.text = "Red Value: \(color.red)"
        blueLabel.text = "Blue Value: \(color.blue)"
        greenLabel.text = "Green Value: \(color.green)"
        alphaLabel.text = "Alpha Value: \(alphaStepper.value)"
        
        view.backgroundColor = UIColor(displayP3Red: CGFloat((redSlider.value)), green: CGFloat((greenSlider.value)), blue: CGFloat((blueSlider.value)), alpha: CGFloat(alphaStepper.value))
    }
    
    
    @IBAction func redSliderSlid(_ sender: UISlider) {
        redLabel.text = "Red Value: \(redSlider.value * 255)"
        
        view.backgroundColor = UIColor(displayP3Red: CGFloat((redSlider.value)), green: CGFloat((greenSlider.value)), blue: CGFloat((blueSlider.value)), alpha: CGFloat(alphaStepper.value))
    }
    
    @IBAction func greenSliderSlid(_ sender: UISlider) {
         greenLabel.text = "Green Value: \(greenSlider.value * 255)"
        
        view.backgroundColor = UIColor(displayP3Red: CGFloat((redSlider.value)), green: CGFloat((greenSlider.value)), blue: CGFloat((blueSlider.value)), alpha: CGFloat(alphaStepper.value))
    }
    
    @IBAction func blueSliderSlid(_ sender: UISlider) {
        blueLabel.text = "Blue Value: \(blueSlider.value * 255)"
        
        view.backgroundColor = UIColor(displayP3Red: CGFloat((redSlider.value)), green: CGFloat((greenSlider.value)), blue: CGFloat((blueSlider.value)), alpha: CGFloat(alphaStepper.value))
    }
    
    @IBAction func alphaStepperPressed(_ sender: UIStepper) {
        alphaLabel.text = "Alpha Value: \(sender.value)"
        
        view.backgroundColor = UIColor(displayP3Red: CGFloat((redSlider.value)), green: CGFloat((greenSlider.value)), blue: CGFloat((blueSlider.value)), alpha: CGFloat(alphaStepper.value))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorNameLabel.text = color.name
        redSlider.value = Float(color.red/255)
        greenSlider.value = Float(color.green/255)
        blueSlider.value = Float(color.blue/255)
        redLabel.text = "Red Value: \(color.red)"
        blueLabel.text = "Blue Value: \(color.blue)"
        greenLabel.text = "Green Value: \(color.green)"
        alphaLabel.text = "Alpha Value: 1.0"
        
        view.backgroundColor = UIColor(displayP3Red: CGFloat((color.red/255)), green: CGFloat((color.green/255)), blue: CGFloat((color.blue/255)), alpha: CGFloat(1.0))
    }
    

}
