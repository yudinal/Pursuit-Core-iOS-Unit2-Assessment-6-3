//
//  CrayonDetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alyson Abril on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CrayonDetailViewController: UIViewController {

    
    @IBOutlet weak var colorNameLabel: UILabel!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var alphaValueLabel: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    
    var crayon: Crayon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
    }
    

    func updateViews() {
        colorNameLabel.text = crayon.name
        view.backgroundColor = UIColor(red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1)
    }
}
