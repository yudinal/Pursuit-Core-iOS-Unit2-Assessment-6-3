//
//  ColorDetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Radharani Ribas-Valongo on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    //MARK: - Properties
      var color: Crayon!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet var background: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var alphaStepper: UIStepper!
    
    @IBOutlet weak var resetColorButton: UIButton!
    
    //MARK: - Functions
    func setUpView() {
        nameLabel.text = color.name
        redSlider.value = Float(color.red)/255
        greenSlider.value = Float(color.green)/255
        blueSlider.value = Float(color.blue)/255
        background.backgroundColor = UIColor(red: CGFloat(color.red)/255, green: CGFloat(color.green)/255, blue: CGFloat(color.blue)/255, alpha: 1.0)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

}
