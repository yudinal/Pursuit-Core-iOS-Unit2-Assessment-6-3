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
    
    
    // CHANGE RGB VALUES VIA SLIDERS
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            model.changeRed(red: CGFloat(sender.value))
            changeRGB()
            rval.text = "\(sender.value)"
        case 1:
            model.changeGreen(green: CGFloat(sender.value))
            changeRGB()
            gval.text = "\(sender.value)"
        case 2:
            model.changeBlue(blue: CGFloat(sender.value))
            changeRGB()
            bval.text = "\(sender.value)"
        default:
            print("Never gonna happen")
        }
    }
    
    // CHANGE BG ALPHA
    @IBAction func alphaStepper(_ sender: UIStepper) {
        model.changeAlpha(alpha: CGFloat(sender.value))
        changeRGB()
        aval.text = "\(sender.value)"
    }
    
    // RESET BUTTON
    @IBAction func resetPressed(_ sender: UIButton) {
        
        model.changeRed(red: crayon.getRedColor())
        model.changeGreen(green: crayon.getGreenColor())
        model.changeBlue(blue: crayon.getBlueColor())
        model.changeAlpha(alpha: crayon.getAlpha())
        setBGColor()
        setDVC()
    }
    
    // DO ALL THIS STUFF BEFORE LOADING
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBGColor()
       
        changeFontColor()
        setDVC()
        changeRGB()
    }
    
    // SET BGCOLOR
    private func setBGColor() {
        self.view.backgroundColor = crayon.getColor()
    }
    
    // CHANGE FONT COLORS ACCORDING TO BGCOLOR
    private func changeFontColor() {
        if crayon.hex == "#000000" {
            crayonName.textColor = .white
            rval.textColor = .white
            gval.textColor = .white
            bval.textColor = .white
            aval.textColor = .white
            r.textColor = .white
            g.textColor = .white
            b.textColor = .white
            a.textColor = .white
        }
    }
    
    // SETTING DVC OUTLET VALUES
    private func setDVC() {
        crayonName.text = crayon.name
        
        redSlider.value = Float(crayon.getRedColor())
        rval.text = "\(Float(crayon.getRedColor()))"
        
        greenSlider.value = Float(crayon.getGreenColor())
        gval.text = "\(Float(crayon.getGreenColor()))"
        
        blueSlider.value = Float(crayon.getBlueColor())
        bval.text = "\(Float(crayon.getBlueColor()))"
        
        aval.text = "1.0"
    }
    
    // UPDATING  VALUES OF COLOR MODEL
    private func changeRGB() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        let alpha = CGFloat(alphaStepper.value)
        self.view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}
