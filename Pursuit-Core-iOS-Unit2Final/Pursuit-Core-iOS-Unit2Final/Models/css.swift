//
//  css.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Jack Wong on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

func btnCSS(_ button: UIButton){
    button.layer.borderWidth = 2.0
    button.layer.cornerRadius = 8
}

func thumbTintCSS(_ slider: UISlider){
    slider.layer.borderWidth = 4.0
    slider.layer.borderColor = UIColor.black.cgColor
}
