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
  @IBOutlet weak var redLabel: UILabel!
  @IBOutlet weak var greenLabel: UILabel!
  @IBOutlet weak var blueLabel: UILabel!
  @IBOutlet weak var alphaLabel: UILabel!
  
  @IBOutlet weak var redSlider: UISlider!
  @IBOutlet weak var greenSlider: UISlider!
  @IBOutlet weak var blueSlider: UISlider!
  
  @IBAction func sliderAction(_ sender: UISlider) {
    switch sender.tag {
    case 0:
      redRGB = CGFloat(sender.value)
      redLabel.text = "Red Value: \(sender.value)"
      setBackground()
    case 1:
      greenRGB = CGFloat(sender.value)
      greenLabel.text = "Green Value: \(greenRGB)"
      setBackground()
    case 2:
      blueRGB = CGFloat(sender.value)
      blueLabel.text = "Blue Value: \(blueRGB)"
      setBackground()
    default:
      "batman wears black"
    }
  }
  
  @IBAction func alphaStepper(_ sender: UIStepper) {
    alphaRGB = CGFloat((sender.value)/10)
    alphaLabel.text = "Alpha Value: \(alphaRGB)"
    setBackground()

  }
  
  @IBAction func resetButton(_ sender: UIButton) {
    setSliders()
  }
  
  var originalColor: Crayon!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setRGB()
    setColorName()
    setSliders()
//    setBackground()
//    redSlider.value = Float(redRGB)
//    greenSlider.value = Float(greenRGB)
//    blueSlider.value = Float(blueRGB)
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
//    setBackground()
  }
  
  func setSliders() {
    setRGB()
    redSlider.value = Float(redRGB)
    greenSlider.value = Float(greenRGB)
    blueSlider.value = Float(blueRGB)
    redLabel.text = "Red Value: \(redRGB)"
    greenLabel.text = "Green Value: \(greenRGB)"
    blueLabel.text = "Blue Value: \(blueRGB)"
    alphaLabel.text = "Alpha Value: \(alphaRGB)"
    setBackground()
  }
  
  func setBackground() {
    var background = UIColor(red: redRGB, green: greenRGB, blue: blueRGB, alpha: alphaRGB)
    if redRGB < 0.3 && greenRGB < 0.3 && blueRGB < 0.3 || alphaRGB <= 0.3{
      colorName.textColor = UIColor.white
      redLabel.textColor = UIColor.white
      greenLabel.textColor = UIColor.white
      blueLabel.textColor = UIColor.white
      alphaLabel.textColor = UIColor.white
    } else {
      colorName.textColor = UIColor.black
      redLabel.textColor = UIColor.black
      greenLabel.textColor = UIColor.black
      blueLabel.textColor = UIColor.black
      alphaLabel.textColor = UIColor.black
    }
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
