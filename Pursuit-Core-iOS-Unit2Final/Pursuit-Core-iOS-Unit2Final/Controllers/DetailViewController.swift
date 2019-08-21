//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Michelle Cueva on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var backgroundColor: Color!
////        didSet {
////            self.view.backgroundColor = backgroundColor.getColor()
////        }
//    }
    
    var crayon: Crayon!

    
    @IBOutlet weak var colorNameLabel: UILabel!
    
    @IBOutlet weak var redValueLabel: UILabel!
    
    @IBOutlet weak var greenValueLabel: UILabel!
    
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var alphaValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var alphaStepper: UIStepper!
    
    @IBAction func redSliderTouched(_ sender: UISlider) {
        backgroundColor.changeRed(red: CGFloat(sender.value))
        updateBackgroundColor()
        
    }
    
    @IBAction func greenSliderTouched(_ sender: UISlider) {
        backgroundColor.changeGreen(green: CGFloat(sender.value))
        updateBackgroundColor()
    }
    
    @IBAction func blueSliderTouched(_ sender: UISlider) {
        backgroundColor.changeBlue(blue: CGFloat(sender.value))
        updateBackgroundColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.init(displayP3Red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1)
        
        backgroundColor = Color(red: CGFloat(crayon.red/255)
            , green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255))
        
        colorNameLabel.text = crayon.name
        redValueLabel.text = (crayon.red/255).description
        blueValueLabel.text = (crayon.red/255).description
        greenValueLabel.text = (crayon.red/255).description
        alphaValueLabel.text = "1"
    }
    
    func updateBackgroundColor() {
        self.view.backgroundColor = backgroundColor.getColor()
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
