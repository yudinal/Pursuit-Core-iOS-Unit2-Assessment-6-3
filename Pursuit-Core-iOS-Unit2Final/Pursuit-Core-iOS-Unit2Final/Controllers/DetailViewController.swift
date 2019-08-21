//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alexander George Legaspi on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var crayon: Crayon!
    var model = ColorsModel()
    
    @IBOutlet weak var crayonName: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            model.changeRed(red: CGFloat(sender.value))
            updateBackgroundColor()
        case 1:
            model.changeGreen(green: CGFloat(sender.value))
            updateBackgroundColor()
        case 2:
            model.changeBlue(blue: CGFloat(sender.value))
            updateBackgroundColor()
        default:
            print("Never gonna happen")
        }
    }
    
    @IBAction func changeAlpha(_ sender: UIStepper) {
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        crayonName.text = crayon.name
        redSlider.value = Float(crayon.red/255)
        greenSlider.value = Float(crayon.green/255)
        blueSlider.value = Float(crayon.blue/255)
        
        view.backgroundColor = UIColor(red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1.0)
        
    }
    
}
