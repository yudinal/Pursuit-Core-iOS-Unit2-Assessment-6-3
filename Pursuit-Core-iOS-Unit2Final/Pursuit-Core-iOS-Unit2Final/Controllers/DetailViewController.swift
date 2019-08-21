//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by hildy abreu on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var crayon: Crayon!
    
    @IBOutlet weak var slider1: UISlider!
    
    
    @IBOutlet weak var slider2: UISlider!
    
    
    @IBOutlet weak var slider3: UISlider!
    
    
    
    @IBAction func sliders(_ sender: UISlider) {
        switch sender.tag {
        case 1:
           
        updateBackgroundColor()
            
        case 2:
          
        updateBackgroundColor()
        case 3:
           
        updateBackgroundColor()
        default:
            print("Impossible")
        
    }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = crayon.displayColors()

        // Do any additional setup after loading the view.
    }
    func updateBackgroundColor (){
        let redValue = slider1.value
        let greenValue = slider2.value
        let blueValue = slider3.value
        view.backgroundColor = UIColor(displayP3Red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: 1)
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
