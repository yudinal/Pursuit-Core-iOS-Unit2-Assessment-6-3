//
//  DetailedViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Kary Martinez on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController  {
    
    var backgroundColor = theColors

    @IBOutlet weak var sliderOne: UISlider!
    @IBOutlet weak var label1: UILabel!
    
    
    @IBOutlet weak var sliderTwo: UISlider!
    
    @IBOutlet weak var label2: UILabel!
    
    
    
    @IBOutlet weak var sliderThree: UISlider!
    
    @IBOutlet weak var label3: UILabel!
    
    
    @IBAction func sliderAction(_ sender: Any) {
        self.view.backgroundColor = UIColor (red:CGFloat(sliderOne.value)/225,green:CGFloat(sliderTwo.value)/225,blue:CGFloat(sliderThree.value)/255,alpha: 1)
        
        label1.text = String(sliderOne.value)
        label2.text = String(sliderTwo.value)
        label3.text = String(sliderThree.value)
    }
    

    
    
 
    
    
    override func viewDidLoad() {
       super.viewDidLoad()
     
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
        // Do any additional setup after loading the view.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



