//
//  ColorChangeViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Sam Roman on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorChangeViewController: UIViewController {

//    var colorFromVC: Crayon!
    
    var red: Double!
    var green: Double!
    var blue: Double!
    var currentColorName: String!
    
    @IBOutlet var viewOut: UIView!
    
    //MARK: - Label Outlets
    @IBOutlet weak var redLabelOut: UILabel!
    @IBOutlet weak var greenLabelOut: UILabel!
    @IBOutlet weak var blueLabelOut: UILabel!
    
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBOutlet weak var colorNameLabel: UILabel!
    
    
    //MARK: - Actions
    
    @IBAction func resetButton(_ sender: UIButton) {
    viewOut.backgroundColor = UIColor(displayP3Red: CGFloat(red), green:  CGFloat(green), blue:  CGFloat(blue), alpha: 1.0)
    redSliderOut.value = Float(red)
    greenSliderOut.value = Float(green)
    blueSliderOut.value = Float(blue)
    }
    
    @IBAction func redSliderAct(_ sender: UISlider) {
   viewOut.backgroundColor = UIColor(displayP3Red: CGFloat(sender.value), green:  CGFloat(greenSliderOut.value), blue:  CGFloat(blueSliderOut.value), alpha: 1.0)
    }
    @IBAction func greenSliderAct(_ sender: UISlider) {
    viewOut.backgroundColor = UIColor(displayP3Red: CGFloat(sender.value), green:  CGFloat(greenSliderOut.value), blue:  CGFloat(blueSliderOut.value), alpha: 1.0)

    }
    @IBAction func blueSliderAct(_ sender: UISlider) {
    viewOut.backgroundColor = UIColor(displayP3Red: CGFloat(sender.value), green:  CGFloat(greenSliderOut.value), blue:  CGFloat(blueSliderOut.value), alpha: 1.0)
    }
    @IBAction func stepperAct(_ sender: UIStepper) {
    }
    
    //MARK: - Outlets
    @IBOutlet weak var redSliderOut: UISlider!
    @IBOutlet weak var greenSliderOut: UISlider!
    @IBOutlet weak var blueSliderOut: UISlider!
    @IBOutlet weak var stepperOut: UIStepper!
    
    
    
    
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
    viewOut.backgroundColor = UIColor(displayP3Red: CGFloat(red), green:  CGFloat(green), blue:  CGFloat(blue), alpha: 1.0)
    colorNameLabel.text = currentColorName
    redSliderOut.value = Float(red)
    greenSliderOut.value = Float(green)
    blueSliderOut.value = Float(blue)
    super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
