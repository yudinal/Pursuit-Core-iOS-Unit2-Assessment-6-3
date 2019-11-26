//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Lilia Yudina on 11/22/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var stepperLabel: UILabel!
    
    var crayons: Crayon?
    
    var color: CGFloat = 0.0 {
        didSet {

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: CGFloat(crayons!.red / 255), green: CGFloat(crayons!.green / 255), blue: CGFloat(crayons!.blue / 255), alpha: CGFloat(1.0))

        updateUI()
        
    }
    
    func configureRedSlider() {
        redSlider.maximumValue = 1.0
        redSlider.minimumValue = 0.0
        redSlider.value = Float(crayons!.red / 255)
    }
    
    func configureGreenSlider() {
        greenSlider.maximumValue = 1.0
        greenSlider.minimumValue = 0.0
        greenSlider.value = Float(crayons!.green / 255)
    }
    func configureBlueSlider() {
        blueSlider.maximumValue = 1.0
        blueSlider.minimumValue = 0.0
        blueSlider.value = Float(crayons!.blue / 255)
    }
    func configureStepper() {
        alphaStepper.maximumValue = 1.0
        alphaStepper.minimumValue = 0.0
        alphaStepper.value = 1.0
        alphaStepper.stepValue = 0.1
    }
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(true)
     }
    func updateUI() {
        guard let theCrayon = crayons else {
            fatalError("Couldn't get a value, verify prepare(for segue: )")
        }
        title = theCrayon.name
        redLabel.text = "\(theCrayon.red.description)"
        greenLabel.text = "\(theCrayon.green.description)"
        blueLabel.text = "\(theCrayon.blue.description)"
        configureRedSlider()
        configureGreenSlider()
        configureBlueSlider()
        configureStepper()
        stepperLabel.text = "\(String(format: "%.1f", alphaStepper.value))"
    }
    @IBAction func redSliderChanged(_ sender: UISlider) {
        view.backgroundColor = UIColor(displayP3Red: CGFloat(sender.value), green: CGFloat(crayons!.green / 255), blue: CGFloat(crayons!.blue / 255), alpha: CGFloat(1.0))
        redLabel.text = "\(sender.value.description)"
    }
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        view.backgroundColor = UIColor(displayP3Red: CGFloat(crayons!.red / 255), green: CGFloat(sender.value), blue: CGFloat(crayons!.blue / 255), alpha: CGFloat(1.0))
              greenLabel.text = "\(sender.value.description)"
    }
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        view.backgroundColor = UIColor(displayP3Red: CGFloat(crayons!.red / 255), green: CGFloat(crayons!.green / 255), blue: CGFloat(sender.value), alpha: CGFloat(1.0))
        blueLabel.text = "\(sender.value.description)"
    }
    @IBAction func stepperChanged(_ sender: UIStepper) {
        view.backgroundColor = UIColor(displayP3Red: CGFloat(crayons!.red / 255), green: CGFloat(crayons!.green / 255), blue: CGFloat(crayons!.blue / 255), alpha: CGFloat(sender.value))
        alphaStepper.value = sender.value
        stepperLabel.text = "\(String(format: "%.1f", alphaStepper.value))"
            }
    @IBAction func resetColorButton(_ sender: UIButton) {
    view.backgroundColor = UIColor(displayP3Red: CGFloat(crayons!.red / 255), green: CGFloat(crayons!.green / 255), blue: CGFloat(crayons!.blue / 255), alpha: CGFloat(1.0))
   updateUI()
    }
}
