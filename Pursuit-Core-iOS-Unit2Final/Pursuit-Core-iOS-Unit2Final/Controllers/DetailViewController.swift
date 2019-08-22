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
 
  @IBOutlet weak var redSlider: UISlider!
  @IBOutlet weak var greenSlider: UISlider!
  @IBOutlet weak var blueSlider: UISlider!
  
  @IBAction func sliderAction(_ sender: UISlider) {
    switch sender.tag {
    case 0:
      redRGB = CGFloat(sender.value)
      setBackground()
    case 1:
      greenRGB = CGFloat(sender.value)
      setBackground()
    case 2:
      blueRGB = CGFloat(sender.value)
      setBackground()
    default:
      "superman's cape is red"
    }
  }
  
  @IBAction func alphaStepper(_ sender: UIStepper) {}
  
  @IBAction func resetButton(_ sender: UIButton) {
    resetSliders()
  }
  
  var originalColor: Crayon!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setRGB()
    setColorName()
//    setBackground()
    redSlider.value = Float(redRGB)
    greenSlider.value = Float(greenRGB)
    blueSlider.value = Float(blueRGB)
  }
  
  func setColorName() {
    colorName.text = originalColor.name
//    self.view.backgroundColor = hexToRGB(hex: originalColor.hex)
  }
  
  var redRGB = CGFloat()
  var greenRGB = CGFloat()
  var blueRGB = CGFloat()
  var alphaRGB = CGFloat()
  
  
  func setRGB() {
     redRGB = CGFloat(originalColor.red/255)
     greenRGB = CGFloat(originalColor.green/255)
     blueRGB = CGFloat(originalColor.blue/255)
     alphaRGB = CGFloat(1.0)
    setBackground()
  }
  
  func resetSliders() {
    setRGB()
    redSlider.value = Float(redRGB)
    greenSlider.value = Float(greenRGB)
    blueSlider.value = Float(blueRGB)
    setBackground()
  }
  
  func setBackground() {
    var background = UIColor(red: redRGB, green: greenRGB, blue: blueRGB, alpha: alphaRGB)
    self.view.backgroundColor = background
  }

  
//  func updateUI(){
//    if let originalColor = originalColor {
//      redSlider.value = 1
//      self.alertSwitch?.on = dsettings.alert
//    }
//  }
//  red: 239, green: 222, blue: 205
  
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
