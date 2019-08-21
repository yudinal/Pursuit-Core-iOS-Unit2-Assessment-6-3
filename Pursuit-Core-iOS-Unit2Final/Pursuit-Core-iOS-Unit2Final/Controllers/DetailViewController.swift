//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Malcolm S. Turnquest on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var detailColorView: UIView!
    @IBOutlet weak var detailColorName: UILabel!
    @IBOutlet weak var detailRedLabel: UILabel!
    @IBOutlet weak var detailRedSlider: UISlider!
    @IBOutlet weak var detailGreenLabel: UILabel!
    @IBOutlet weak var detailGreenSlider: UISlider!
    @IBOutlet weak var detailBlueLabel: UILabel!
    @IBOutlet weak var detailBlueSlider: UISlider!
    @IBOutlet weak var detailAlphaLabel: UILabel!
    @IBOutlet weak var detailAlphaStepper: UIStepper!
    
    public var colorSelected: Crayon?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateColor()


    }
    private func updateColor() {
        guard let colorSelected = colorSelected else {fatalError("color is nil")}
        detailColorView.backgroundColor = UIColor(displayP3Red: CGFloat((colorSelected.red)/255), green: CGFloat((colorSelected.green)/255), blue: CGFloat((colorSelected.blue)/255), alpha: 1.0)
        detailColorName.text = colorSelected.name
        detailRedLabel.text = "Red value: \(Int(colorSelected.red))"
        detailRedSlider.value = Float((colorSelected.red)/255)
        detailGreenLabel.text = "Green value: \(Int(colorSelected.green))"
        detailGreenSlider.value = Float((colorSelected.green)/255)
        detailBlueLabel.text = "Blue value: \(Int(colorSelected.blue))"
        detailBlueSlider.value = Float((colorSelected.blue)/255)
        detailAlphaLabel.text = "Alpha value: 1.0"
        detailAlphaStepper.value = 1
        
    }
    private func updateFromSliders() {
        let red = detailRedSlider.value
        let green = detailGreenSlider.value
        let blue = detailBlueSlider.value
        let alpha = detailAlphaStepper.value
        detailColorView.backgroundColor = UIColor(displayP3Red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
        
    }
    
    @IBAction func redSliderChanged(_ sender: Any) {
        let value = detailRedSlider.value
        detailRedLabel.text = "Red value: \(Int((value)*255))"
        updateFromSliders()

    }
    
    @IBAction func greenSliderChanged(_ sender: Any) {
        let value = detailGreenSlider.value
        detailGreenLabel.text = "Green value: \(Int((value)*255))"
        updateFromSliders()

    }
    @IBAction func blueSliderChanged(_ sender: Any) {
        let value = detailBlueSlider.value
        detailBlueLabel.text = "Blue value: \(Int((value)*255))"
        updateFromSliders()
    }
    
    @IBAction func alphaStepperChanged(_ sender: Any) {
        let value = detailAlphaStepper.value
        detailAlphaLabel.text = "Alpha value: \(String(format: "%.1f", value))"
        updateFromSliders()
    }
    
    @IBAction func resetColor(_ sender: UIButton) {
        updateColor()
    }
    
    
    
    
    
}
