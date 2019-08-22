//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Kimball Yang on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var daCrayons: Crayon!
//    let originalValueRed = Float(daCrayons.red)/255
//    let originalValueGreen = Float(daCrayons.green)/255
//    let originalValueBlue = Float(daCrayons.blue)/255
    
    
    @IBOutlet weak var detCrayonLabel: UILabel!

    // just some labels outlets
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    // just some slider outlets
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var AlphaStepper: UIStepper!
    @IBOutlet weak var resetValue: UIButton!
    
    
    
    @IBAction func redSlider(_ sender: Any) {
        updateBackgroundColor()
        redLabel.text = "Red \(redSlider.value)"
    }
    @IBAction func greenSlider(_ sender: Any) {
        updateBackgroundColor()
        greenLabel.text = "Green \(greenSlider.value)"
    }
    @IBAction func blueSlider(_ sender: Any) {
        updateBackgroundColor()
        blueLabel.text = "Blue \(blueSlider.value)"
    }
    @IBAction func AlphaStepper(_ sender: Any) {
        updateBackgroundColor()
    }
    
    @IBAction func resetValue(_ sender: Any) {
        // this resets the background color
        view.backgroundColor = UIColor(displayP3Red: CGFloat((daCrayons.red)/255), green: CGFloat((daCrayons.green)/255), blue: CGFloat((daCrayons.blue)/255), alpha: 1)
        // this resets the slider positions and stepper
        redSlider.value = Float(daCrayons.red)/255
        greenSlider.value = Float(daCrayons.green)/255
        blueSlider.value = Float(daCrayons.blue)/255
        AlphaStepper.value = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    
     private func setUpViews() {
        // this sets up the intended view
        detCrayonLabel.text = daCrayons.name
        redLabel.text = "Red \(redSlider.value)"
        greenLabel.text = "Green \(greenSlider.value)"
        blueLabel.text = "Blue \(blueSlider.value)"
        // this reflects the current value of colors from the segue
        view.backgroundColor = UIColor(displayP3Red: CGFloat((daCrayons.red)/255), green: CGFloat((daCrayons.green)/255), blue: CGFloat((daCrayons.blue)/255), alpha: 1)
        // this reflects the current slider value of the color selected
        redSlider.value = Float(daCrayons.red)/255
        greenSlider.value = Float(daCrayons.green)/255
        blueSlider.value = Float(daCrayons.blue)/255
        AlphaStepper.value = 1
    }
    
    // updates the background color based on slider
    private func updateBackgroundColor() {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(AlphaStepper.value))
    }
    
    //func updateColor() {
    //    let color = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value)/*, alpha: CGFloat(AlphaStepper.value)*/)

    }

