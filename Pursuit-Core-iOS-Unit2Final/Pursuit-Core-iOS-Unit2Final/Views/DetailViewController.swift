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
    
    
    
    @IBAction func redSlider(_ sender: Any) {
    }
    @IBAction func greenSlider(_ sender: Any) {
    }
    @IBAction func blueSlider(_ sender: Any) {
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        view.backgroundColor = UIColor(displayP3Red: CGFloat((daCrayons.red)/255), green: CGFloat((daCrayons.green)/255), blue: CGFloat((daCrayons.blue)/255), alpha: 1)
   //     redSlider.value = Float(daCrayons.red)/255)

    }
    
    private func setUpViews() {
        detCrayonLabel.text = daCrayons.name
 //       redSlider.value = Float(daCrayons.red)/255)
//        greenSlider.value = Float((daCrayons.green)/255)
//        blueSlider.value = Float((daCrayons.blue)/255)
        
     //   updateColor()
        

    }
    //func updateColor() {
    //    let color = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value)/*, alpha: CGFloat(AlphaStepper.value)*/)

    }

