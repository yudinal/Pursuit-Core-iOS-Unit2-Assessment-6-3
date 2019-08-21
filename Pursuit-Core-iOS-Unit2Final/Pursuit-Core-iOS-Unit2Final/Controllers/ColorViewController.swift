//
//  ColorViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by albert coelho oliveira on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController{
    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var red: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var redSlidderOut: UISlider!
    @IBOutlet weak var greenOut: UISlider!
    @IBOutlet weak var blueOut: UISlider!
    @IBOutlet weak var alphaLabel: UILabel!
    var crayonColor: Crayon!
    var redColor = Double ()
    var blue = Double ()
   var green = Double ()
    @IBOutlet weak var stepperOut: UIStepper!
    
    
    @IBAction func slidderAction(_ sender: UISlider) {
        switch sender.tag {
        case 1:
            crayonColor.red = Double(sender.value)
            updateSlidders ()
            updateBackground ()
        case 2:
            crayonColor.green = Double(sender.value)
            updateSlidders ()
            updateBackground ()
            
        case 3:
            crayonColor.blue = Double(sender.value)
            updateSlidders ()
            updateBackground ()
        default:
            print("nothing")
        }
    }
    @IBAction func resetButton(_ sender: UIButton){
        resetColor()
        updateBackground ()
        updateSlidders()
    }
    @IBAction func stepperAct(_ sender: UIStepper) {
        
        view.backgroundColor = crayonColor.updateWithAlpha(alpha: CGFloat(sender.value))
        alphaLabel.text = "Alpha: \(sender.value.description)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        storeValue ()
        updateBackground()
        updateSlidders()
    }
    
    private func updateBackground (){
        self.view.backgroundColor = crayonColor.changeValue()
    }
    
    private func updateSlidders (){
        redSlidderOut.value = Float(crayonColor.red)
        greenOut.value = Float(crayonColor.green)
        blueOut.value = Float(crayonColor.blue)
        red.text = "Red: \(crayonColor.red/255)"
        greenLabel.text = "Green: \(crayonColor.green/255)"
        blueLabel.text = "Blue: \(crayonColor.blue/255)"
        colorName.text = crayonColor.name
        alphaLabel.text = "Alpha: \(stepperOut.value.description)"
    }
    private func resetColor (){
        crayonColor.red = redColor
        crayonColor.green = green
        crayonColor.blue = blue
        stepperOut.value = 1
    }
    private func storeValue () {
        redColor = crayonColor.red
        green = crayonColor.green
        blue = crayonColor.green
    }
}


