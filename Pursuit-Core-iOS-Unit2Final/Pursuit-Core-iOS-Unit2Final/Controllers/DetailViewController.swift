//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Pursuit on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var eachColor : Crayon!
    var slideColor = ColorObject()
    
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBAction func sliderChange(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            slideColor.changeRed(red: CGFloat(sender.value))
            updateBackgroundColor()

        case 1:
            slideColor.changeGreen(green: CGFloat(sender.value))
            updateBackgroundColor()
        case 2:
            slideColor.changeBlue(blue: CGFloat(sender.value))
            updateBackgroundColor()
        default:
            print("This won't work")
        }
    }

    func updateBackgroundColor() {
        self.view.backgroundColor = slideColor.getColor()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = eachColor.displayAllColors()

    }
    

}


