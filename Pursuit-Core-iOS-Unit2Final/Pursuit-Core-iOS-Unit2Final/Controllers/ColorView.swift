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
    @IBAction func redSliderFunc(_ sender: UISlider) {
        redValue.text = "Red Value: \(redSlider.value)"
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
    }
    @IBAction func blueSliderFunc(_ sender: UISlider) {
        blueValue.text = "Blue Value: \(blueSlider.value)"
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
    }
    
    @IBAction func greenSliderFunc(_ sender: UISlider) {
        greenValue.text = "Green Value: \(greenSlider.value)"
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
    }
    
    @IBAction func alphaSlider(_ sender: UISlider) {
        alphaValue.text = "Alpha Value: \(alphaSlider.value)"
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
    }
    
    
    
    
    
    @IBAction func resetAction(_ sender: UIButton) {
        redValue.text = "Red Value: \(crayon.red / 255)"
        redSlider.value = Float(crayon.red / 255)
        blueSlider.value = Float(crayon.blue / 255)
        greenSlider.value = Float(crayon.green / 255)
        alphaSlider.value = Float(0.5)
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorName.text = crayon.name
        redValue.text = "Red Value: \(crayon.red / 255)"
        redSlider.value = Float(crayon.red / 255)
        blueValue.text = "Blue Value: \(crayon.blue / 255)"
        blueSlider.value = Float(crayon.blue / 255)
        greenValue.text = "Green Value: \(crayon.green / 255)"
        greenSlider.value = Float(crayon.green / 255)
        alphaSlider.value = Float(0.5)
       colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
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
