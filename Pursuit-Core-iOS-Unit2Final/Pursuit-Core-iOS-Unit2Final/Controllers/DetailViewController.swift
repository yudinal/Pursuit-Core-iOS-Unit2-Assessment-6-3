//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Jocelyn Boyd on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  //MARK: -- Outlets
  @IBOutlet weak var crayonNameLabel: UILabel!
  
  @IBOutlet weak var redSlider: UISlider!
  @IBOutlet weak var redValueLabel: UILabel!
  
  @IBOutlet weak var greenSlider: UISlider!
  @IBOutlet weak var greenValueLabel: UILabel!
  
  @IBOutlet weak var blueSlider: UISlider!
  @IBOutlet weak var blueValueLabel: UILabel!
  
  @IBOutlet weak var resetButton: UIButton!
  
  
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
