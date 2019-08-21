//
//  PaletteViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Jack Wong on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class PaletteViewController: UIViewController {
    
    @IBOutlet weak var selectedColorLabel: UILabel!
    
    
    //Color Labels
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    //Color Sliders
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaStepper: UIStepper!
    
    var crayonChoice: Crayon?
    
    var redValue: Double? {
        didSet {
            updateEverthing()
        }
    }
    var greenValue: Double? {
        didSet {
            updateEverthing()
        }
    }
    var blueValue: Double? {
        didSet {
            updateEverthing()
        }
    }
    var alphaValue: Double? {
        didSet {
            updateEverthing()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let initialCrayon = crayonChoice{
            
            redValue = initialCrayon.red / 255
            greenValue = initialCrayon.green / 255
            blueValue = initialCrayon.blue / 255
            alphaValue = 1.0
            
            selectedColorLabel.text = initialCrayon.name
        }
        
    }
    
    
    func updateEverthing() {
        
        guard let red = redValue, let green = greenValue, let blue = blueValue, let alphaVal = alphaValue  else {
            return
        }
        
        self.view.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alphaVal))
        
        redSlider.value = Float(red)
        redLabel.text = "Red: \(redSlider.value)"
        
        greenSlider.value = Float(green)
        greenLabel.text = "Green: \(greenSlider.value)"
        
        blueSlider.value = Float(blue)
        blueLabel.text = "Blue: \(blueSlider.value)"
        
        alphaStepper.value = alphaVal
        alphaLabel.text = "Alpha: \(alphaStepper.value)"
        
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
        alphaValue = alphaStepper.value
    }
    
    
}

extension PaletteViewController: UITextFieldDelegate{
    
}
