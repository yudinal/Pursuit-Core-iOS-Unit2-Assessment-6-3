//
//  ColorChangeViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Sam Roman on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorChangeViewController: UIViewController {

    var colorFromVC: Crayon!

    
    //MARK: - Label Outlets
    @IBOutlet weak var redLabelOut: UILabel!
    @IBOutlet weak var greenLabelOut: UILabel!
    @IBOutlet weak var blueLabelOut: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var colorNameLabel: UILabel!
    
    @IBOutlet var labelCollection: [UILabel]!
    
    
    //MARK: - Actions
    
    @IBAction func resetButton(_ sender: UIButton) {
        setBGColor()
    }
    
    @IBAction func redSliderAct(_ sender: UISlider) {
        redLabelOut.text = "Red: \(Float(sender.value))"
        updateBGColor()

    }
    @IBAction func greenSliderAct(_ sender: UISlider) {
        greenLabelOut.text = "Green: \(Float(sender.value))"
        updateBGColor()


    }
    @IBAction func blueSliderAct(_ sender: UISlider) {
        blueLabelOut.text = "Blue: \(Float(sender.value))"
        updateBGColor()

    }
    @IBAction func stepperAct(_ sender: UIStepper) {
        alphaLabel.text = "Alpha: \(Float(sender.value))"
        updateBGColor()
    }
    
    
    //MARK: - Outlets
    @IBOutlet weak var redSliderOut: UISlider!
    @IBOutlet weak var greenSliderOut: UISlider!
    @IBOutlet weak var blueSliderOut: UISlider!
    @IBOutlet weak var stepperOut: UIStepper!
    
    
    //MARK: - Background Color Methods
    private func setBGColor(){
    view.backgroundColor = colorFromVC.getColor()
    print(colorFromVC.blue)
    colorNameLabel.text = colorFromVC.name
    redSliderOut.value = Float(colorFromVC.red)
    greenSliderOut.value = Float(colorFromVC.green)
    stepperOut.value = 1.0
    blueSliderOut.value = Float(colorFromVC.blue)
    redLabelOut.text = "Red: \(Float(colorFromVC.red))"
    blueLabelOut.text = "Blue: \(Float(colorFromVC.blue))"
    greenLabelOut.text = "Green: \(Float(colorFromVC.green))"
    alphaLabel.text = "Alpha: 1.0"
    
    
    }
    
    private func updateBGColor() {
        let redSliderVal = CGFloat(redSliderOut.value)
        let blueSliderVal = CGFloat(blueSliderOut.value)
        let greenSliderVal = CGFloat(greenSliderOut.value)
        let alphaVal = CGFloat(stepperOut.value)
        view.backgroundColor = UIColor(displayP3Red: redSliderVal, green: greenSliderVal, blue: blueSliderVal, alpha: alphaVal)
    }

    
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
    setBGColor()
    super.viewDidLoad()
    }

}



// Extra Credit function:
//    func changeTextColor(){
//        if redSliderOut.value < 0.3 && blueSliderOut.value < 0.3 || greenSliderOut.value < 0.3  || stepperOut.value < 0.9 {
//            for i in labelCollection {
//                i.textColor = UIColor.white
//            }
//        } else if redSliderOut.value > 0.3 && blueSliderOut.value > 0.3 && greenSliderOut.value > 0.3 || stepperOut.value >= 0.9 {
//            for i in labelCollection {
//                i.textColor = UIColor.darkGray
//            }
//        }
//    }




