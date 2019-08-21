//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Jocelyn Boyd on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  
  //MARK: -- Internal Properties
  var TheCurrentColor = Crayon.allTheCrayons
  
  //MARK: -- IBOutlets
  @IBOutlet weak var crayonNameLabel: UILabel!
  @IBOutlet weak var redValueLabel: UILabel!
  @IBOutlet weak var greenValueLabel: UILabel!
  @IBOutlet weak var blueValueLabel: UILabel!
  
  @IBOutlet weak var redSlider: UISlider!
  @IBOutlet weak var greenSlider: UISlider!
  @IBOutlet weak var blueSlider: UISlider!
  
  
  @IBOutlet weak var resetButton: UIButton!
  
  //MARK: -- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
      
//        populateOutlet()

    }
 

//  @IBAction func adjustCurrentColor(_ sender: UISlider) {
//  }
 

  //MARK: -- Private methods
  func populateOutlet() {
//    crayonNameLabel.text = 
//    redValueLabel.text = "Current Red Value\()"
//    greenValueLabel.text = "Current Green Value \()"
//    blueValueLabel.text = "Current Blue Value \()"
  }


}
