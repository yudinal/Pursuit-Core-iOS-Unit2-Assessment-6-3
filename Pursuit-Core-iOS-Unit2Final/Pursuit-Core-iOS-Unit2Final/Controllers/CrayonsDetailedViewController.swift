//
//  CrayonsDetailedViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Mariel Hoepelman on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

//When the user selects a row, you should segue to a Detail View. The Detail view should have:
//A UILabel to show the name of the selected Crayon
//A background color that starts as the same color as the selected Crayon.
//A UISlider and UILabel that represents the current red value
//A UISlider and UILabel that represents the current green value
//A UISlider and UILabel that represents the current blue value
//A UIStepper and UILabel that represents the current alpha
//A reset UIButton that sets all the sliders and labels to be the corresponding colors of the Crayon the user selected and resets the alpha to 1.0.

import UIKit

class CrayonsDetailedViewController: UIViewController {
    
    var crayon: Crayon!
    
    @IBOutlet weak var selectedCrayonNameLabel: UILabel!
    @IBOutlet weak var currentRedValueLabel: UILabel!
    @IBOutlet weak var currentGreenValueLabel: UILabel!
    @IBOutlet weak var currentBlueValueLabel: UILabel!
    @IBOutlet weak var currentAlphaValueLabel: UILabel!
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedCrayonNameLabel.text = crayon.name
        currentRedValueLabel.text = String(crayon.red)
        currentGreenValueLabel.text = String(crayon.green)
        currentBlueValueLabel.text = String(crayon.blue)
//        currentAlphaValueLabel.text = String(1.0)
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
