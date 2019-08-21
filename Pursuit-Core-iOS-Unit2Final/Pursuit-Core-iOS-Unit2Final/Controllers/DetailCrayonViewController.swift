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
    }
    
    @IBAction func movedGreenSlider(_ sender: UISlider) {
    }
    
    @IBAction func movedBlueSlider(_ sender: UISlider) {
    }
    
    
    @IBAction func pressedStepper(_ sender: UIStepper) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews() {
        //give initial values on loadup
        redSlider.value = Float(crayon.red / 255)
        greenSlider.value = Float(crayon.green / 255)
        blueSlider.value = Float(crayon.blue / 255)
        alphaStepper.value = 1
        nameLabel.text = crayon.name
        //call custom private functions
        updateBackgroundColor()
        changeLabelTexts()
    }
    
    //MARK: -- Custom private functions
    private func updateBackgroundColor() {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaStepper.value))
    }
    
    private func changeLabelTexts() {
        redValueLabel.text = "Red Value: \(String(format: "%.2f", redSlider.value))"
        greenValueLabel.text = "Green Value: \(String(format: "%.2f", greenSlider.value))"
        blueValueLabel.text = "Blue Value: \(String(format: "%.2f", blueSlider.value))"
        alphaValueLabel.text = "Alpha Value: \(String(alphaStepper.value))"
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
