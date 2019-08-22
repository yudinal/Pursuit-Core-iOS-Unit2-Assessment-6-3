//
//  ColorManipulatingViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Liana Norman on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorManipulatingViewController: UIViewController {
    
    var color: Crayon!
    
    @IBOutlet weak var colorName: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var resetColorButton: UIButton!
    @IBOutlet weak var liveRedSliderValue: UILabel!
    @IBOutlet weak var liveGreenSliderValue: UILabel!
    @IBOutlet weak var liveBlueSliderValue: UILabel!
    @IBOutlet weak var iAmRed: UILabel!
    @IBOutlet weak var iAmGreen: UILabel!
    @IBOutlet weak var iAmBlue: UILabel!
    
    @IBAction func resetColorsButton(_ sender: Any) {
        setUpViews()
//        redSlider.value = Float(color.convertRedToCGFloatNumber(red: color.red))
//        greenSlider.value = Float(color.convertGreenToCGFloatNumber(green: color.green))
//        blueSlider.value = Float(color.convertBlueToCGFloatNumber(blue: color.blue))
    }
    
    @IBAction func sliderColorChange(_ sender: UISlider) {
        switch sender.tag {
        case 0:
           color.updateRed(red: CGFloat(sender.value))
           updateBackgroundColor(red: CGFloat(sender.value), green: color.convertGreenToCGFloatNumber(green: color.green), blue: color.convertBlueToCGFloatNumber(blue: color.blue))
            liveRedSliderValue.text = String(sender.value)
            print(sender.value)
           print("I am \(color.red) at REDSLIDER")
           print("I am \(color.green) at REDSLIDER")
            print("I am \(color.blue) at REDSLIDER")
            
        case 1:
            color.updateGreen(green: CGFloat(sender.value))
            updateBackgroundColor(red: color.convertRedToCGFloatNumber(red: color.red), green: CGFloat(sender.value), blue: color.convertBlueToCGFloatNumber(blue: color.blue))
            liveGreenSliderValue.text = String(sender.value)
            print(sender.value)
            print("I am \(color.red) at GREENSLIDER")
            print("I am \(color.green) at GREENSLIDER")
            print("I am \(color.blue) at GREENSLIDER")
        case 2:
            color.updateBlue(blue: CGFloat(sender.value))
            updateBackgroundColor(red: color.convertRedToCGFloatNumber(red: color.red), green: color.convertGreenToCGFloatNumber(green: color.green), blue: CGFloat(sender.value))
            liveBlueSliderValue.text = String(sender.value)
            print(sender.value)
            print("I am \(color.red) at BLUESLIDER")
            print("I am \(color.green) at BLUESLIDER")
            print("I am \(color.blue) at BLUESLIDER")
        default:
            print("Something happened")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        print("I am the red slider value \(redSlider.value)")
        print("I am the green slider value \(greenSlider.value)")
        print("I am the blue slider value \(blueSlider.value)")

        // Do any additional setup after loading the view.
    }
    
    
    func updateBackgroundColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func setUpViews() {
        colorName.text = color.name
        redSlider.value = Float(color.convertRedToCGFloatNumber(red: color.red))
        greenSlider.value = Float(color.convertGreenToCGFloatNumber(green: color.green))
        blueSlider.value = Float(color.convertBlueToCGFloatNumber(blue: color.blue))
        view.backgroundColor = UIColor(red: color.convertRedToCGFloatNumber(red: color.red), green: color.convertGreenToCGFloatNumber(green: color.green), blue: color.convertBlueToCGFloatNumber(blue: color.blue), alpha: 1.0)
        liveRedSliderValue.text = color.convertRedToCGFloatNumber(red: color.red).description
        liveGreenSliderValue.text = color.convertGreenToCGFloatNumber(green: color.green).description
        liveBlueSliderValue.text = color.convertBlueToCGFloatNumber(blue: color.blue).description
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
