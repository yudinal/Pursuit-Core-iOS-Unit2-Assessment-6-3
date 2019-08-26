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
    
    // these are the outlets and labels that are used for the sliders and stepper
    
    @IBAction func resetRGBvalue(_ sender: UIButton) {
    }
    // this is the function to reset the default color values.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorNameLabel.text = color.name
        // this is to update the label that I have for the Color Name label to display when it is selected.
        
        view.backgroundColor = UIColor(displayP3Red: (CGFloat(color.red/255)), green: CGFloat(color.green/255), blue: CGFloat(color.blue/255), alpha: 1)
        // this is to display the color as the background when it is selected from the view controller.
    }

}
