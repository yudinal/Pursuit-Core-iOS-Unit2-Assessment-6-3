//
//  DetailedColorViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Bianca Brown on 8/26/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailedColorViewController: UIViewController {
    
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redColorLabel: UILabel!
    
    
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueColorLabel: UILabel!
    
    
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenColorLabel: UILabel!
    
    
    
    @IBOutlet weak var alphaStepperChanger: UIStepper!
    @IBOutlet weak var alphaStepperLabel: UILabel!
    
    // these are the outlets and labels that are used for the sliders and stepper
    
    @IBAction func resetRGBvalue(_ sender: UIButton) {
    }
    
    // this is the function to reset the default color values.
    
    var color: Crayon!
    // this is the instance of the model that we are annotating
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
