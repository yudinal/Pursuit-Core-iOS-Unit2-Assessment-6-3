//
//  DetailColorViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Phoenix McKnight on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
import UIKit

class DetailColorViewController: UIViewController {
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var blueSliderLabel: UILabel!
    @IBOutlet weak var greenSliderLabel: UILabel!
    @IBOutlet weak var alphaSliderLabel: UILabel!
    @IBOutlet weak var redTextFieldOutlet: UITextField!
    
    @IBOutlet weak var redSliderLabel: UILabel!
    var passingInfo:Crayon!
    var changingColors:UIColor!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       edgeCase()
        setUpInitialValues()
        setUpNamesOfLabels()
     
       // changeView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func setUpNamesOfLabels() {
        redSliderLabel.text = "\(arrayOfNamesForViewControllerLabels()[0]) : \(redSlider.value)"
        blueSliderLabel.text = "\(arrayOfNamesForViewControllerLabels()[2]) : \(blueSlider.value)"
        greenSliderLabel.text = "\(arrayOfNamesForViewControllerLabels()[1]) : \(greenSlider.value)"
        alphaSliderLabel.text = "\(arrayOfNamesForViewControllerLabels()[3]) : \(String(format: "%.1f", alphaStepper.value))"
        resetButton.setTitle(arrayOfNamesForViewControllerLabels()[4], for: .normal)
        colorName.text = passingInfo.name
//        redTextFieldOutlet.text = "\(arrayOfNamesForViewControllerLabels()[0]) : \(redSlider.value)"
    }
    func setUpInitialValues() {
        
       
        redSlider.value = Float(passingInfo.red)
        greenSlider.value = Float(passingInfo.green)
        blueSlider.value = Float(passingInfo.blue)
        alphaStepper.value = Double(defaultAlpha())
        view.backgroundColor = UIColor(red: CGFloat(redSlider!.value), green: CGFloat(greenSlider!.value), blue: CGFloat(blueSlider!.value), alpha: CGFloat(alphaStepper!.value))
    }
    
    @IBAction func redSliderAction(_ sender: UISlider) {
         redSlider.value = sender.value
        changeUIColorWithSlider()
        setUpNamesOfLabels()
        }
    @IBAction func blueSliderAction(_ sender: UISlider) {
        blueSlider.value = sender.value
        changeUIColorWithSlider()
        setUpNamesOfLabels()
    }
    @IBAction func greenSliderAction(_ sender: UISlider) {
        greenSlider.value = sender.value
        changeUIColorWithSlider()
        setUpNamesOfLabels()
    }
    @IBAction func alphaStepperAction(_ sender: UIStepper) {
        alphaStepper.value = sender.value
        changeUIColorWithSlider()
        setUpNamesOfLabels()
    }
    @IBAction func resetButton(_ sender: UIButton) {
        setUpInitialValues()
        setUpNamesOfLabels()
    }
    
    func changeUIColorWithSlider() {
        view.backgroundColor = UIColor(red: CGFloat(redSlider!.value), green: CGFloat(greenSlider!.value), blue: CGFloat(blueSlider!.value), alpha: CGFloat(alphaStepper!.value))
        let arrayOfLabels = [redSliderLabel,blueSliderLabel,greenSliderLabel,alphaSliderLabel,colorName]
        if redSlider.value > 0.0 &&  greenSlider.value > 0.0 && blueSlider.value > 0.0  && alphaStepper.value > 0.5  {
        
            arrayOfLabels.forEach({$0?.textColor = .black})
            
        } else {
            arrayOfLabels.forEach({$0?.textColor = .white})
        }
        
    }
    func edgeCase() {
        if colorName.text == edgeCaseColors()[0] {
            let arrayOfLabels = [redSliderLabel,blueSliderLabel,greenSliderLabel,alphaSliderLabel,colorName]
            
            arrayOfLabels.forEach({$0?.textColor = .white})
            

        }
        
    }
    func arrayOfNamesForViewControllerLabels() -> [String] {
        return ["Red","Green","Blue","Alpha","Reset Button"]
    }
    func edgeCaseColors() -> [String] {
        return ["Black"]
    }
   

}



