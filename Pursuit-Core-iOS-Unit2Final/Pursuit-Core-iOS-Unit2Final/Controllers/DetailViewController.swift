//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Ian Cervone on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  
  
  @IBOutlet weak var colorName: UILabel!
  
  @IBAction func redSlider(_ sender: UISlider) {}
  @IBAction func greenSlider(_ sender: UISlider) {}
  @IBAction func blueSlider(_ sender: UISlider) {}
  
  @IBAction func alphaStepper(_ sender: UIStepper) {}
  
  @IBAction func resetButton(_ sender: UIButton) {}
  
  var originalColor: Crayon!

  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setDetails()
  }
  
  func setDetails() {
    colorName.text = originalColor.name
    self.view.backgroundColor = hexToRGB(hex: originalColor.hex)
  }
  
  
  
  
  
//  class Crayon
//    var name: String
//    var red: Double
//    var green: Double
//    var blue: Double
//    var hex: String
  
  
  
//  override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//    self.view.backgroundColor = hexToRGB(hex: originalColor.hex)
//
  
//    colorName.text = Crayon.allTheCrayons[IndexPath]
//  }
  
//
  
  
  
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
