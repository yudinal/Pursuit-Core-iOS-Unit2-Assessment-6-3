//
//  ColorDetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Mr Wonderful on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    
    
    var newRedValue:CGFloat!
    var newGreenValue:CGFloat!
    var newBlueValue:CGFloat!
    var newAlphaValue:CGFloat!
    var detailColor:Crayon!
    
    var labelArray:[UILabel]!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var colorName: UILabel!
    @IBOutlet var alphaLabel: UILabel!
    @IBOutlet var alphaStepper: UIStepper!
    
    
    func changeLabelColor(){
        switch alphaStepper.value{
        case 0.0...0.6:
            labelArray.forEach({$0.textColor = .white})
        default:
            labelArray.forEach({$0.textColor = .black})
        }
    }
    
    func resetVariableValue(){
         newRedValue = CGFloat(redSlider.value)
         newGreenValue = CGFloat(greenSlider.value)
         newBlueValue = CGFloat(blueSlider.value)
         newAlphaValue = 1
    }
    func setSlidersValue(){
        redSlider.value =  Float(detailColor.red/255.0)
        greenSlider.value = Float(detailColor.green/255.0)
        blueSlider.value = Float(detailColor.blue/255.0)
        alphaStepper.value = Double(1)
    }
    
    func populateView(){
        colorName.text = detailColor.name
        view.backgroundColor = generateColor()
        labelArray = [redLabel, greenLabel, blueLabel, alphaLabel]
    }
    func generateColor() -> UIColor{
        return UIColor(red:CGFloat(detailColor.red/255.0), green: CGFloat(detailColor.green/255.0), blue:CGFloat(detailColor.blue/255.0), alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
        setSlidersValue()
    }
    
    func changeBackGroundColor(){
        view.backgroundColor = UIColor(red: newRedValue ?? CGFloat(detailColor.red/255.0), green: newGreenValue ?? CGFloat(detailColor.green/255.0), blue: newBlueValue ?? CGFloat(detailColor.blue/255.0), alpha: newAlphaValue ?? CGFloat(1))
    }
    
    @IBAction func redSliderAction(_ sender: UISlider) {
        newRedValue = CGFloat(sender.value)
        changeBackGroundColor()
        redLabel.text = "Red Hex Value: (\(sender.value))"
    }
    
    @IBAction func greenSliderAction(_ sender: UISlider) {
        newGreenValue = CGFloat(sender.value)
        changeBackGroundColor()
        greenLabel.text = "Green Value: (\(sender.value)"
    }
    
    @IBAction func blueSliderAction(_ sender: UISlider) {
        newBlueValue = CGFloat(sender.value)
        changeBackGroundColor()
        blueLabel.text = "Blue Value: (\(sender.value)"
    }
    
    @IBAction func alphaStepperAction(_ sender: UIStepper) {
        newAlphaValue = CGFloat(sender.value)
        changeBackGroundColor()
        alphaLabel.text = "Alpha Value: (\(sender.value)"
        changeLabelColor()
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
       populateView()
        setSlidersValue()
       resetVariableValue()
        
    }
}
