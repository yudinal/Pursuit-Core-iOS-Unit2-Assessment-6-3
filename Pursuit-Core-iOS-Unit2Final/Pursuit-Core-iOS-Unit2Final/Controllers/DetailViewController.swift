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
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redSlider.minimumValue = 0.0
        redSlider.maximumValue = 1.0
        blueSlider.minimumValue = 0.0
        blueSlider.maximumValue = 1.0
        greenSlider.minimumValue = 0.0
        greenSlider.maximumValue = 1.0
        
        redSlider.value = Float(currentCrayon.red/255)
        blueSlider.value = Float(currentCrayon.blue/255)
        greenSlider.value = Float(currentCrayon.green/255)
        
        redValueLabel.text = "Red: \(redSlider.value)"
        greenValueLabel.text = "Green: \(greenSlider.value)"
        blueValueLabel.text = "Blue: \(blueSlider.value)"
        colorNameLabel.text = currentCrayon.name
        view.backgroundColor = UIColor(displayP3Red: CGFloat(currentCrayon.red/255), green: CGFloat(currentCrayon.green/255) , blue: CGFloat(currentCrayon.blue/255), alpha: 1)
        
        

    
    }
    

}
