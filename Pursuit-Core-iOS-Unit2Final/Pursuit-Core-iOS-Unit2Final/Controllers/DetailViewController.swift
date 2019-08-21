//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Angela Garrovillas on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaStepper: UIStepper!
    
    @IBAction func sliderSlides(_ sender: UISlider) {
        updateViewBackground()
    }
    @IBAction func stepperTapped(_ sender: UIStepper) {
        updateViewBackground()
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        resetValues()
    }
    
    private func updateViewBackground() {
        let newColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaStepper.value))
        self.view.backgroundColor = newColor
    }
//    func changeToValuesToDefaultColor() {
//        redSlider.value = 
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        crayon.delegate = self
        self.view.backgroundColor = crayon.getUIColor()

        // Do any additional setup after loading the view.
    }
}

extension DetailViewController: UIColorable {
    var defaultRed: Float {return Float(crayon.red/255)}
    var defaultGreen: Float {return Float(crayon.green/255)}
    var defaultBlue: Float {return Float(crayon.blue/255)}
    var defaultAlpha: Double {return 1}

    func resetValues() {
        redSlider.value = defaultRed
        greenSlider.value = defaultGreen
        blueSlider.value = defaultBlue
        alphaStepper.value = 1
        updateViewBackground()
    }
}
