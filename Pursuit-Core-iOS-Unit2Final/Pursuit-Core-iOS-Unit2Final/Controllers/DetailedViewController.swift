//
//  DetailedViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Kary Martinez on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController  {
    
    var currentCrayon: Crayon!
    @IBOutlet weak var sliderOne: UISlider! //red
    @IBOutlet weak var nameOfCrayon: UILabel!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var steperOutlet: UIStepper!
    
    @IBOutlet weak var sliderTwo: UISlider! //green
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var alphaLabel: UILabel!
    
    
    @IBOutlet weak var sliderThree: UISlider! //blue
    
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var resetButtonOutlet: UIButton!
    
    @IBAction func resetButton(_ sender: Any) {
        ResetButton()
        
    }
    
    
    @IBAction func mySteper(_ sender: Any) {
        changeBackgroundColor()
    }
    
    
    @IBAction func sliderAction(_ sender: Any) {
       changeBackgroundColor()
        setLabelWhenSliderMoves()
        
    
    }
    
    
    func changeBackgroundColor() {
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(sliderOne.value), green: CGFloat(sliderTwo.value), blue: CGFloat(sliderThree.value), alpha: CGFloat(steperOutlet.value))
    }
    
   
    
    func setLabelWhenSliderMoves () {
        label1.text = String(sliderOne.value)
        label2.text = String(sliderTwo.value)
        label3.text = String(sliderThree.value)
    }
    
    func setdefaultControlValues() {
        sliderOne.value = Float(currentCrayon.red/255)
        sliderTwo.value = Float(currentCrayon.green/255)
        sliderThree.value = Float(currentCrayon.blue/255)
        steperOutlet.value = 1.0
    }
    
    func setDefaultBackgroundColor () {
        let convertedRedValue = currentCrayon.red/255
        let convertedBlueValue = currentCrayon.blue/255
        let convertedGreenValue = currentCrayon.green/255
        
        view.backgroundColor = UIColor(displayP3Red: CGFloat(convertedRedValue), green: CGFloat(convertedGreenValue), blue: CGFloat(convertedBlueValue), alpha: 1.0)
    }
    
    func setSliderMaxValues () {
        sliderOne.maximumValue = 1
        sliderTwo.maximumValue = 1
        sliderThree.maximumValue = 1
    }
    
    func ResetButton () {
        self.setDefaultBackgroundColor()
        self.setdefaultControlValues()
 
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSliderMaxValues()
        setDefaultBackgroundColor()
        nameOfCrayon.text = currentCrayon.name
        setdefaultControlValues()
        
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



