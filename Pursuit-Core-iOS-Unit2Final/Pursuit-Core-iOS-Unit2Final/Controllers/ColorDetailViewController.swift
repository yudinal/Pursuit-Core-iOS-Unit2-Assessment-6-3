//
//  ColorDetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Radharani Ribas-Valongo on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    //MARK: - Properties
    var color: Crayon!
    var colorSlider = ColorsForSlider()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet var background: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var resetColorButton: UIButton!
    
    
    //MARK: - Functions
    @IBAction func sliderChanged(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            colorSlider.changeRed(red: CGFloat(sender.value))
            updateBackgroundColor()
        case 1:
            colorSlider.changeGreen(green: CGFloat(sender.value))
            updateBackgroundColor()
        case 2:
            colorSlider.changeBlue(blue: CGFloat(sender.value))
            updateBackgroundColor()
        default:
            print("How did this happen")
        }
    }
    
    
    @IBAction func alphaChanged(_ sender: UIStepper) {
        colorSlider.changeAlpha(alpha: CGFloat(sender.value))
        updateBackgroundColor()
    }
    
    func updateBackgroundColor() {
        background.backgroundColor = colorSlider.getColor()
    }
    func setUpView() {
        nameLabel.text = color.name
        redSlider.value = Float(color.red)/255
        greenSlider.value = Float(color.green)/255
        blueSlider.value = Float(color.blue)/255
        background.backgroundColor = UIColor(red: CGFloat(color.red)/255, green: CGFloat(color.green)/255, blue: CGFloat(color.blue)/255, alpha: 1.0)
        colorSlider.changeRed(red: CGFloat(color.red)/255)
        colorSlider.changeGreen(green: CGFloat(color.green)/255)
        colorSlider.changeBlue(blue: CGFloat(color.blue)/255)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

}
