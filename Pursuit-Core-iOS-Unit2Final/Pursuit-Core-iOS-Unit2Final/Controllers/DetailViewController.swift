//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alexander George Legaspi on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MODEL INSTANCES
    var crayon: Crayon!
    var model = ColorsModel()
    
    // OUTLETS
    @IBOutlet weak var crayonName: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var rval: UILabel!
    @IBOutlet weak var gval: UILabel!
    @IBOutlet weak var bval: UILabel!
    @IBOutlet weak var aval: UILabel!
    @IBOutlet weak var r: UILabel!
    @IBOutlet weak var g: UILabel!
    @IBOutlet weak var b: UILabel!
    @IBOutlet weak var a: UILabel!
    
    // CHANGE RGB VALUES
    @IBAction func sliderChanged(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            model.changeRed(red: CGFloat(sender.value))
            updateBackgroundColor()
            rval.text = "\(sender.value)"
        case 1:
            model.changeGreen(green: CGFloat(sender.value))
            updateBackgroundColor()
            gval.text = "\(sender.value)"
        case 2:
            model.changeBlue(blue: CGFloat(sender.value))
            updateBackgroundColor()
            bval.text = "\(sender.value)"
        default:
            print("Never gonna happen")
        }
    }
    
    // CHANGES BGCOLOR
    func updateBackgroundColor() {
        self.view.backgroundColor = model.getColor()
    }
    
    // CHANGE ALPHA
    @IBAction func alphaStepper(_ sender: UIStepper) {
        model.changeAlpha(alpha: CGFloat(sender.value))
        updateBackgroundColor()
        aval.text = "\(sender.value)"
    }
    
    // RESET BUTTON
    @IBAction func resetPressed(_ sender: UIButton) {
        model.changeRed(red: CGFloat(crayon.red/255))
        model.changeGreen(green: CGFloat(crayon.green/255))
        model.changeBlue(blue: CGFloat(crayon.blue/255))
        model.changeAlpha(alpha: 1.0)
        updateBackgroundColor()
        
        redSlider.value = Float(crayon.red/255)
        greenSlider.value = Float(crayon.green/255)
        blueSlider.value = Float(crayon.blue/255)
        alphaStepper.value = Double(model.alpha)
        
        
        rval.text = "\(CGFloat(crayon.red/255))"
        gval.text = "\(CGFloat(crayon.green/255))"
        bval.text = "\(CGFloat(crayon.blue/255))"
        aval.text = "1.0"
    }
    
    // DO ALL THIS STUFF BEFORE LOADING
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // STORING RGB VALUES
        let red = crayon.red/255
        let green = crayon.green/255
        let blue = crayon.blue/255
        
        // SETTING SLIDER VALUES
        crayonName.text = crayon.name
        redSlider.value = Float(red)
        rval.text = "\(Float(red))"
        greenSlider.value = Float(green)
        gval.text = "\(Float(green))"
        blueSlider.value = Float(blue)
        bval.text = "\(Float(blue))"
        
        // SETTING BACKGROUND COLOR
        self.view.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
        
        // UPDATING THE VALUES THE MODEL INSTANCE
        model.changeRed(red: CGFloat(red))
        model.changeGreen(green: CGFloat(green))
        model.changeBlue(blue: CGFloat(blue))
    }
    
}
