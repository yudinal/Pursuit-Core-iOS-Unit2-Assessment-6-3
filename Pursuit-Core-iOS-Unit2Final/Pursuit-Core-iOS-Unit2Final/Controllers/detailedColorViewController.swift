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
    @IBAction func redvalueSliderAction(_ sender: UISlider) {
    }
    @IBOutlet weak var redValueLabel: UILabel!
    
    
    @IBOutlet weak var blueValueSlider: UISlider!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    
    @IBOutlet weak var greenValueSlider: UISlider!
    @IBOutlet weak var greenValueLabel: UILabel!
    


    
    @IBOutlet weak var resetButtonOutlet: UIButton!
    
    
    @IBAction func resetButton(_ sender: Any) {
    }
    
//    MARK -- Variables
    var detailedCrayon: Crayon!
    
    
    
    
    
//    var detailedBackground = back
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        crayonColorNameOutlet.text = detailedCrayon.name
        
        view.backgroundColor = UIColor(displayP3Red: CGFloat(detailedCrayon.red)/255, green: CGFloat(detailedCrayon.green)/255, blue: CGFloat(detailedCrayon.blue)/255, alpha: 1)
        
        
        
//        var blue = UIColor(displayP3Red: 0, green: 0, blue: 1, alpha: 1)
//        blueValueSlider = UIColor(displayP3Red: 0, green: 0, blue: 1, alpha: 1)
//        view.backgroundColor = blue

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
