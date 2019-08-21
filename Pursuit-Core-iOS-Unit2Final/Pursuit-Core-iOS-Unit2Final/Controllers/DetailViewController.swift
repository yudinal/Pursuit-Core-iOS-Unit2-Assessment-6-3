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
    }
    
    @IBOutlet weak var greenLabel: UILabel!
    @IBAction func greenSlider(_ sender: Any) {
    }
    
    @IBOutlet weak var blueLabel: UILabel!
    @IBAction func blueSlider(_ sender: Any) {
    }
    
    @IBOutlet weak var alphaLabel: UILabel!
    @IBAction func alphaStepper(_ sender: Any) {
    }
    
    @IBAction func resetButton(_ sender: Any) {
    }
    
    
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
        
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(crayon!.red/255), green: CGFloat(crayon!.green/255), blue: CGFloat(crayon!.blue/255), alpha: 1.0)
        
    }
    
    

}
