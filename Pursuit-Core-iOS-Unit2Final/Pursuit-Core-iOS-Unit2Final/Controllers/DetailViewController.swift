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
    
    func updateBackgroundColor() {
        self.view.backgroundColor = model.getColor()
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // STORING RGB VALUES
        let red = crayon.red/255
        let green = crayon.green/255
        let blue = crayon.blue/255
        
        // SETTING SLIDER VALUES
        crayonName.text = crayon.name
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        // SETTING BACKGROUND COLOR
        self.view.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
        
        // UPDATING THE VALUES THE MODEL INSTANCE
        model.changeRed(red: CGFloat(red))
        model.changeGreen(green: CGFloat(green))
        model.changeBlue(blue: CGFloat(blue))
        
    }
    
}