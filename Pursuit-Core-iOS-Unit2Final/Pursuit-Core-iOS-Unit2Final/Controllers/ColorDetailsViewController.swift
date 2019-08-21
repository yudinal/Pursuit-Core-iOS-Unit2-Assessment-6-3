//
//  ColorDetailsViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Krystal Campbell on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorDetailsViewController: UIViewController {

    var currentRed: CGFloat = 0.5
    var currentGreen: CGFloat = 0.5
    var currentBlue: CGFloat = 0.5
    var Alpha: CGFloat = 1
    
    
//    let red = CGFloat(redSlider.value)
//    let blue = CGFloat(blueSlider.value)
//    let green = CGFloat(greenSlider.value)
//
//
    var colorSelectedDetail: Crayon!
    
    @IBOutlet weak var colorSelected: UILabel!
    
    @IBOutlet weak var redValueLabel: UILabel!
    
    @IBOutlet weak var greenValueLabel: UILabel!
    
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var alphaStepperOutlet: UIStepper!
    
    @IBOutlet weak var currentAlpha: UILabel!
    
    
    @IBAction func resetButton(_ sender: UIButton) {
    }
    
    @IBAction func colorRedSlider(_ sender: UISlider) {
        currentRed = CGFloat(sender.value)
        
    }
    
    @IBAction func colorGreenSlider(_ sender: UISlider) {
        currentGreen = CGFloat(sender.value)
    }
    
    @IBAction func colorBlueSlider(_ sender: UISlider) {
        currentBlue = CGFloat(sender.value)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorSelected.text = colorSelectedDetail.name
        
        view.backgroundColor = UIColor(displayP3Red: CGFloat(colorSelectedDetail.red/255), green: CGFloat(colorSelectedDetail.green/255), blue: CGFloat(colorSelectedDetail.blue/255), alpha: 1)
        

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


