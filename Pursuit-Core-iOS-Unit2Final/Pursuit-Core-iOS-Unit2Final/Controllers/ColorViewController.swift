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
    var crayonColor: Crayon!
    @IBAction func slidderAction(_ sender: UISlider) {
        switch sender.tag {
        case 1:
      crayonColor.red = Double(sender.value)
      updateBackground ()
        case 2:
       crayonColor.green = Double(sender.value)
             updateBackground ()
            
        case 3:
          crayonColor.blue = Double(sender.value)
        updateBackground ()
        default:
            print("nothing")
        }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBackground()
        updateSlidders()
    }
 
    private func updateBackground (){
        self.view.backgroundColor = crayonColor.changeValue()
    }
    private func updateSlidders (){
        redSlidderOut.value = Float(crayonColor.red)
        greenOut.value = Float(crayonColor.green)
        blueOut.value = Float(crayonColor.green)
        red.text = "Red: \(crayonColor.red/255)"
        greenLabel.text = "Green: \(crayonColor.green/255)"
        blueLabel.text = "Blue: \(crayonColor.blue/255)"
        colorName.text = crayonColor.name
    }
    }


