//
//  DetailedColorViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Bianca Brown on 8/26/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailedColorViewController: UIViewController {
    
    var color: Crayon!
    // this is the instance of the model that we are annotating
    
    @IBOutlet weak var colorNameLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redColorLabel: UILabel!
    
    
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueColorLabel: UILabel!
    
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenColorLabel: UILabel!

    @IBOutlet weak var alphaStepperChanger: UIStepper!
    @IBOutlet weak var alphaStepperLabel: UILabel!
    
    @IBAction func stepperChanger(_ sender: Any) {
        view.backgroundColor = UIColor(displayP3Red: (CGFloat(redSlider.value)), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaStepperChanger!.value))
        print(alphaStepperChanger!.value)
        
    
    }
    // these are the outlets and labels that are used for the sliders and stepper
    
    @IBAction func resetRGBvalue(_ sender: UIButton) {
        
        redSlider.value = Float(color.red/255)
        blueSlider.value = Float(color.blue/255)
        greenSlider.value = Float(color.green/255)
        alphaStepperChanger.value = 1
        
        defaultColorBackground()
        
    }
    // this is the function to reset the default color values.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorNameLabel.text = color.name
        // this is to update the label that I have for the Color Name label to display when it is selected.
        redSlider.value = Float(color.red/255)
        blueSlider.value = Float(color.blue/255)
        greenSlider.value = Float(color.green/255)
        alphaStepperChanger.value = 1
        
        defaultColorBackground()
    }
    func defaultColorBackground() {
        view.backgroundColor = UIColor(displayP3Red: (CGFloat(redSlider.value)), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        // this is to display the color as the background when it is selected from the view controller.
    }
    @IBAction func steppersDidChange(_ sender: UISlider) {
        
//          view.backgroundColor = UIColor(displayP3Red: (CGFloat(sender.value/255)), green: CGFloat(sender.value/255), blue: CGFloat(sender.value/255), alpha: 1)
//        print(sender.value)
        view.backgroundColor = UIColor(displayP3Red: (CGFloat(redSlider.value)), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaStepperChanger!.value))
        print(alphaStepperChanger!.value)
    }
    
    
}
