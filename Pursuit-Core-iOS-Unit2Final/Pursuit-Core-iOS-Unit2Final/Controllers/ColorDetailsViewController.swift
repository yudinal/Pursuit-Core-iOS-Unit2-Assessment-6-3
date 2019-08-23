//
//  ColorDetailsViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Krystal Campbell on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorDetailsViewController: UIViewController {
    
    var colorSelectedDetail: Crayon!

    var red: CGFloat = 0.5
    var green: CGFloat = 0.5
    var blue: CGFloat = 0.5
    var Alpha: CGFloat = 1

/*func colorDisplay () {
    
    let red = CGFloat(redSlider.value)
    let blue = CGFloat(blueSlider.value)
    let green = CGFloat(greenSlider.value)
    let color = UIColor(
        red: red,
        green: green,
        blue: blue,
        alpha: 1.0)
    if view.backgroundColor == UIColor(displayP3Red: CGFloat(colorSelectedDetail.red/255), green: CGFloat(colorSelectedDetail.green/255), blue: CGFloat(colorSelectedDetail.blue/255), alpha: 1){
       // redValueLabel.text = redSlider.
      //  redSlider.self = redValueLabel.text
        
        }
}*/

//
    @IBOutlet weak var colorSelected: UILabel!
    
    @IBOutlet weak var redValueLabel: UILabel!
    
    @IBOutlet weak var greenValueLabel: UILabel!
    
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var alphaStepperOutlet: UIStepper!
    
    @IBOutlet weak var currentAlpha: UILabel!
    
    @IBAction func alphaStepper(_ sender: UIStepper) {
        
        currentAlpha.text = String(format: "Current Alpha Value: %.2f", alphaStepperOutlet.value)
       //  let currentAlphaValue = Double(sender.value)
        view.backgroundColor = UIColor(displayP3Red: red, green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaStepperOutlet!.value))
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        alphaStepperOutlet.value = 1
         currentAlpha.text = "Current Alpha: \(alphaStepperOutlet.value)"
        colorSelected.text = colorSelectedDetail.name
        view.backgroundColor = UIColor(displayP3Red: CGFloat(colorSelectedDetail.red/255), green: CGFloat(colorSelectedDetail.green/255), blue: CGFloat(colorSelectedDetail.blue/255), alpha: 1)
        
        
        redSlider.value = Float(colorSelectedDetail.red/255)
        redValueLabel.text = String(format: "Red Value: %.2f", redSlider.value)
        
        blueSlider.value = Float(colorSelectedDetail.blue/255)
        blueValueLabel.text = String(format: "Blue Value: %.2f", blueSlider.value)
        
        greenSlider.value = Float(colorSelectedDetail.green/255)
        greenValueLabel.text = String(format: "Green Value: %.2f", greenSlider.value)

        
    }
    
    @IBAction func colorRedSlider(_ sender: UISlider) {
        let currentRedValue = Double(sender.value)
        redValueLabel.text = "Red Value: \(currentRedValue)"
        red = CGFloat(sender.value)
//        view.backgroundColor = UIColor(
//                red: red,
//                green: 0.0,
//                blue: 0.0,
//                alpha: 1.0)
        view.backgroundColor = UIColor(displayP3Red: red, green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaStepperOutlet!.value))
      //  currentAlpha.text = "Alpha: \()"
        }
    
    @IBAction func colorGreenSlider(_ sender: UISlider) {
        green = CGFloat(sender.value)
        let currentGreenValue = Double(sender.value)
        greenValueLabel.text = "Green Value: \(currentGreenValue)"
//        view.backgroundColor = UIColor(
//            red: 0.0,
//            green: green,
//            blue: 0.0,
//            alpha: 1.0)
        view.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: green, blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaStepperOutlet!.value))
    }
    
    @IBAction func colorBlueSlider(_ sender: UISlider) {
        blue = CGFloat(sender.value)
        let currentBlueValue = Double(sender.value)
        blueValueLabel.text = "Blue Value: \(currentBlueValue)"
//        view.backgroundColor = UIColor(
//            red: 0.0,
//            green: 0.0,
//            blue: blue,
//            alpha: 1.0)
        view.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green:CGFloat(greenSlider.value), blue: blue, alpha: CGFloat(alphaStepperOutlet!.value))
    }


    func changeRed(red: CGFloat) {
        self.red = red
    }
    
    
    func changeBlue(blue: CGFloat) {
        self.blue = blue
    }
    
    
    func changeGreen(green: CGFloat) {
        self.green = green
    }
    
//    private func updateRedValue() {
//        redValueLabel.text = UIColor(CGFloat(red/255))
//
//         }
//
//
//
//    private func updateGreenValue() {
//        greenValueLabel.
//    }
//
//    private func updateBlueValue() {
//         blueValueLabel.
//        }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorSelected.text = colorSelectedDetail.name
        
        view.backgroundColor = UIColor(displayP3Red: CGFloat(colorSelectedDetail.red/255), green: CGFloat(colorSelectedDetail.green/255), blue: CGFloat(colorSelectedDetail.blue/255), alpha: 1)
        
        redSlider.value = Float(colorSelectedDetail.red/255)
        redValueLabel.text = String(format: "Red Value: %.2f", redSlider.value)
        
        blueSlider.value = Float(colorSelectedDetail.blue/255)
        blueValueLabel.text = String(format: "Blue Value: %.2f", blueSlider.value)
        
        greenSlider.value = Float(colorSelectedDetail.green/255)
        greenValueLabel.text = String(format: "Green Value: %.2f", greenSlider.value)

        currentAlpha.text = "Current Alpha: \(alphaStepperOutlet.value)"
        
        
        
//        blueValueLabel.text = "\(blueSlider.value)"
//        blueSlider.value = Float(colorSelectedDetail.blue/255)
//        greenValueLabel.text = "\(greenSlider.value)"
//        greenSlider.value = Float(colorSelectedDetail.green/255)
        
        
        //        blueValueLabel.text = UIColor(blue:)
        //        blueValueLabel.text = UIColor(blue: CGFloat(colorSelectedDetail.blue/255))

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


    // Do any additional setup after loading the view.
}

