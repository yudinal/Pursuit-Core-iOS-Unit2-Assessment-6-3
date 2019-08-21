//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Aaron Pachesa on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var crayonName: UILabel!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBAction func redSlider(_ sender: UISlider) {
        redLabel.text = String(sender.value)

        self.view.backgroundColor = UIColor(red: CGFloat(sender.value), green: CGFloat(greenSliderOutlet!.value), blue: CGFloat(blueSliderOutlet!.value), alpha: 0.5)
    }
    
    @IBOutlet weak var greenLabel: UILabel!
    @IBAction func greenSlider(_ sender: UISlider) {
        greenLabel.text = String(sender.value)
        
        self.view.backgroundColor = UIColor(red: CGFloat(redSliderOutlet.value), green: CGFloat(sender.value), blue: CGFloat(blueSliderOutlet!.value), alpha: 0.5)
    }
    
    @IBOutlet weak var blueLabel: UILabel!
    @IBAction func blueSlider(_ sender: UISlider) {
        blueLabel.text = String(sender.value)
        
        self.view.backgroundColor = UIColor(red: CGFloat(redSliderOutlet.value), green: CGFloat(greenSliderOutlet.value), blue: CGFloat(sender.value), alpha: 0.5)
    }
    
    
    @IBOutlet weak var alphaLabel: UILabel!
    @IBAction func alphaStepper(_ sender: Any) {
    }
    
    @IBAction func resetButton(_ sender: Any) {
    }
    
    @IBOutlet weak var redSliderOutlet: UISlider!
    @IBOutlet weak var greenSliderOutlet: UISlider!
    @IBOutlet weak var blueSliderOutlet: UISlider!
    
    
    
    var crayon: Crayon?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUI()
    }
    
    
    func SetUI() {
        crayonName.text = crayon?.name
        
        redLabel.text = String(crayon!.red/255)
        
        greenLabel.text = String(crayon!.green/255)
        
        blueLabel.text = String(crayon!.blue/255)
        
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(crayon!.red/255), green: CGFloat(crayon!.green/255), blue: CGFloat(crayon!.blue/255), alpha: 0.5)
        
    }
    
    

}
