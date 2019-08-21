//
//  DetailCrayonViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Jason Ruan on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailCrayonViewController: UIViewController {
    
    var crayon: Crayon!
    
    //MARK: -- IBOutlets
        //Label outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
        //slider outlets
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
        //stepper outlets
    @IBOutlet weak var alphaStepper: UIStepper!
    
    //MARK: -- IBActions
    
    @IBAction func movedRedSlider(_ sender: UISlider) {
        updateBackgroundColor()
        changeLabelTexts()
    }
    
    @IBAction func movedGreenSlider(_ sender: UISlider) {
        updateBackgroundColor()
        changeLabelTexts()
    }
    
    @IBAction func movedBlueSlider(_ sender: UISlider) {
        updateBackgroundColor()
        changeLabelTexts()
    }
    
    @IBAction func pressedStepper(_ sender: UIStepper) {
        updateBackgroundColor()
        changeLabelTexts()
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        setUpViews()
    }
    
    //MARK: -- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = crayon.name
        setUpViews()
    }

    //MARK: -- Custom private functions
    private func setUpViews() {
        //give initial values on loadup
        redSlider.value = Float(crayon.red / 255)
        greenSlider.value = Float(crayon.green / 255)
        blueSlider.value = Float(crayon.blue / 255)
        alphaStepper.value = 1
        //call custom private functions
        updateBackgroundColor()
        changeLabelTexts()
    }

    private func updateBackgroundColor() {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaStepper.value))
    }
    
    private func changeLabelTexts() {
        redValueLabel.text = "Red Value: \(String(format: "%.2f", redSlider.value))"
        greenValueLabel.text = "Green Value: \(String(format: "%.2f", greenSlider.value))"
        blueValueLabel.text = "Blue Value: \(String(format: "%.2f", blueSlider.value))"
        alphaValueLabel.text = "Alpha Value: \(String(format: "%.2f", alphaStepper.value))"
    }

}
