//
//  ColorView.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by God on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorView: UIViewController {
var crayon: Crayon!
    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueValue: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var alphaValue: UILabel!
    @IBOutlet var colorView: UIView!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var stepperOutlet: UIStepper!
    
    @IBAction func redSliderFunc(_ sender: UISlider) {
        redValue.text = String(format: "Red Value: %.2f", redSlider.value)
        redValue.textColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(0.0), blue: CGFloat(0.0), alpha: CGFloat(1.0))
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        navigationController?.navigationBar.barTintColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
    }
    @IBAction func stepperAction(_ sender: UIStepper) {
        alphaSlider.value = Float(sender.value)
        alphaValue.text = "Alpha Value: \(alphaSlider.value)"
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        navigationController?.navigationBar.barTintColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        stepperOutlet.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
        
        
        
    }
    @IBAction func blueSliderFunc(_ sender: UISlider) {
        blueValue.text = String(format: "Blue Value: %.2f", blueSlider.value)
        blueValue.textColor = UIColor(red: CGFloat(0.0), green: CGFloat(0.0), blue: CGFloat(blueSlider.value), alpha: CGFloat(1.0))
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        navigationController?.navigationBar.barTintColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
    }
    
    @IBAction func greenSliderFunc(_ sender: UISlider) {
        greenValue.text = String(format: "Green Value: %.2f", greenSlider.value)
        greenValue.textColor = UIColor(red: CGFloat(0.0), green: CGFloat(greenSlider.value), blue: CGFloat(0.0), alpha: 1.0)
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        navigationController?.navigationBar.barTintColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
    }
    
    @IBAction func alphaSlider(_ sender: UISlider) {
        alphaValue.text = String(format: "Alpha Value: %.2f", alphaSlider.value)
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        navigationController?.navigationBar.barTintColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
    }
    
    
    
    
    
    @IBAction func resetAction(_ sender: UIButton) {
        redValue.text = String(format: "Red Value: %.2f", crayon.red / 255)
        redSlider.value = Float(crayon.red / 255)
        blueValue.text = String(format: "Blue Value: %.2f", crayon.blue / 255)
        blueSlider.value = Float(crayon.blue / 255)
        
        greenValue.text = String(format: "Green Value: %.2f", crayon.green / 255)
        alphaValue.text = "Alpha Value: 1.0"
//        "Green Value: \(crayon.green / 255)"
        greenSlider.value = Float(crayon.green / 255)
        alphaSlider.value = Float(1.0)
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
         navigationController?.navigationBar.barTintColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        stepperOutlet.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorName.text = crayon.name
        redValue.text = String(format: "Red Value: %.2f", redSlider.value)
        redSlider.value = Float(crayon.red / 255)
        blueValue.text = String(format: "Blue Value: %.2f", blueSlider.value)
        blueSlider.value = Float(crayon.blue / 255)
        greenValue.text = String(format: "Green Value: %.2f", greenSlider.value)
        greenSlider.value = Float(crayon.green / 255)
        alphaSlider.value = Float(1.0)
       colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        colorName.textColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        colorName.shadowColor = UIColor.white
        colorName.shadowOffset = CGSize(width: CGFloat(1.5), height: CGFloat(1.5))
        navigationController?.navigationBar.barTintColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        stepperOutlet.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
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
