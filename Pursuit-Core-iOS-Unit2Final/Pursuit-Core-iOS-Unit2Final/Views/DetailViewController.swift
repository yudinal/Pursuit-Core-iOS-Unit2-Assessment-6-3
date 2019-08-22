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
    }
    @IBAction func greenSlider(_ sender: Any) {
        updateBackgroundColor()
    }
    @IBAction func blueSlider(_ sender: Any) {
        updateBackgroundColor()
    }
    @IBAction func AlphaStepper(_ sender: Any) {
        updateBackgroundColor()
    }
    
    @IBAction func resetValue(_ sender: Any) {
//        redSlider.value = originalValueRed
//        greenSlider.value = originalValueGreen
//        blueSlider.value = originalValueBlue
        view.backgroundColor = UIColor(displayP3Red: CGFloat((daCrayons.red)/255), green: CGFloat((daCrayons.green)/255), blue: CGFloat((daCrayons.blue)/255), alpha: 1)
        
        redSlider.value = Float(daCrayons.red)/255
        greenSlider.value = Float(daCrayons.green)/255
        blueSlider.value = Float(daCrayons.blue)/255
        AlphaStepper.value = 1
       // updateBackgroundColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    // this reflects
        view.backgroundColor = UIColor(displayP3Red: CGFloat((daCrayons.red)/255), green: CGFloat((daCrayons.green)/255), blue: CGFloat((daCrayons.blue)/255), alpha: 1)
    // this reflects the current slider value of the color selected
       redSlider.value = Float(daCrayons.red)/255
       greenSlider.value = Float(daCrayons.green)/255
       blueSlider.value = Float(daCrayons.blue)/255
        AlphaStepper.value = 1
        
//        let originalValueRed = Float(daCrayons.red)/255
//        let originalValueGreen = Float(daCrayons.green)/255
//        let originalValueBlue = Float(daCrayons.blue)/255
        
    }
    
    
     private func setUpViews() {
        detCrayonLabel.text = daCrayons.name
 //       redSlider.value = Float(daCrayons.red)/255)
//        greenSlider.value = Float((daCrayons.green)/255)
//        blueSlider.value = Float((daCrayons.blue)/255)
        
     //   updateColor()
        

    }
    
    // updates the background color based on slider
    private func updateBackgroundColor() {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(AlphaStepper.value))
    }
    
    //func updateColor() {
    //    let color = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value)/*, alpha: CGFloat(AlphaStepper.value)*/)

    }

