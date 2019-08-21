//
//  detailedColorViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Tia Lendor on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class detailedColorViewController: UIViewController {
    
//    MARK -- Outlets

    @IBOutlet weak var crayonColorNameOutlet: UILabel!
    
    @IBOutlet weak var redValueSlider: UISlider!
    @IBOutlet weak var redValueLabel: UILabel!
    
    
    @IBOutlet weak var blueValueSlider: UISlider!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    
    @IBOutlet weak var greenValueSlider: UISlider!
    @IBOutlet weak var greenValueLabel: UILabel!
    


    
    @IBOutlet weak var resetButtonOutlet: UIButton!
    
    
    @IBAction func resetButton(_ sender: Any) {
        view.backgroundColor = UIColor(red: CGFloat(detailedCrayon.red)/255, green: CGFloat(detailedCrayon.green)/255, blue: CGFloat(detailedCrayon.blue)/255, alpha: 1)
//        reloadInputViews()

    }
    
//    MARK -- Variables
    var detailedCrayon: Crayon!
    var slide = ColorsModel()
    
//    MARK -- Actions
    
  
    @IBAction func colorSliderChanged(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            slide.changeRed(red: CGFloat(sender.value))
            redValueLabel.text = "\(redValueSlider.value)"
            updateBackgroundColor()
        case 1:
            slide.changeBlue(blue: CGFloat(sender.value))
            blueValueLabel.text = "\(blueValueSlider.value)"
            updateBackgroundColor()
        case 2:
            slide.changeGreen(green: CGFloat(sender.value))
            greenValueLabel.text = "\(greenValueSlider.value)"
            updateBackgroundColor()
        default:
            fatalError("Unexpected Error")
        }
        
        
    }
    
    func updateBackgroundColor() {
        self.view.backgroundColor = slide.getColor()
    }
    
    
//    var detailedBackground = back
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        crayonColorNameOutlet.text = detailedCrayon.name
        
        view.backgroundColor = UIColor(displayP3Red: CGFloat(detailedCrayon.red)/255, green: CGFloat(detailedCrayon.green)/255, blue: CGFloat(detailedCrayon.blue)/255, alpha: 1)
        
//        view.backgroundColor = UIColor(red: CGFloat(redValueSliderAction.value), green: CGFloat(UISlider(greenValueSliderAction.value)), blue: CGFloat(blueValueSlider.value), alpha: 1)
        
//        var myBackground = redValueSliderAction(UISlider)
//        redValueSlider.self
        
        
//        , blueValueSliderAction;(UISlider)();, greenValueSliderAction(UISlider)
        reloadInputViews()

//         Do any additional setup after loading the view.
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

