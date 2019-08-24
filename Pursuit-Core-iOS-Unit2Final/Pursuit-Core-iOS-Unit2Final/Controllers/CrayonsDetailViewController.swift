//
//  CrayonsDetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Eric Widjaja on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

//Create DetailVC and a variable

class CrayonsDetailViewController: UIViewController {
    
    var crayons: Crayon!
    
//Created and connected Outlets to show the users
    @IBOutlet weak var CrayonColorName: UILabel!
    
    @IBOutlet weak var RedSlider: UISlider!
    @IBOutlet weak var RedLabel: UILabel!
    
    
    @IBOutlet weak var GreenSlider: UISlider!
    @IBOutlet weak var GreenLabel: UILabel!
    
    @IBOutlet weak var BlueSlider: UISlider!
    @IBOutlet weak var BlueLabel: UILabel!
    
    
    @IBOutlet weak var AlphaStepper: UIStepper!
    @IBOutlet weak var AlphaLabel: UILabel!
    
    @IBOutlet weak var ResetButton: UIButton!
    
//App at default state, created functions to adapt on UserInputs
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultBackgroundColor(ResetButton)
    }
    
    private func defaultValues() {
        RedSlider.value = Float(crayons.red/255)
        GreenSlider.value = Float(crayons.green/255)
        BlueSlider.value = Float (crayons.blue/255)
        AlphaStepper.value = 1
        
        updateLabels()
    }

    private func updateLabels() {
        RedLabel.text = "\(String(format: "%.3f", RedSlider.value))"
        GreenLabel.text = "\(String(format: "%.3f", GreenSlider.value))"
        BlueLabel.text = "\(String(format: "%.3f", BlueSlider.value))"
        AlphaLabel.text = "\(String(format: "%.1f", AlphaStepper.value))"
        CrayonColorName.text = crayons!.name
        
    }
    
    func updateColor() {

        let color = UIColor(displayP3Red: CGFloat(RedSlider.value), green: CGFloat(GreenSlider.value), blue: CGFloat(BlueSlider.value), alpha: CGFloat(AlphaStepper.value))
        view.backgroundColor = color
        updateLabels()
    }

//IBActions -- reacted with UserInput
    @IBAction func sliderChanged(_ slider: UISlider) {
        updateColor()
    }
    
    @IBAction func stepperChanged(_ stepper: UIStepper) {
        updateColor()
    }
    
    @IBAction func defaultBackgroundColor (_ button: UIButton) {
      view.backgroundColor = crayons.color()
        defaultValues()
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
