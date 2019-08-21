//
//  ColorsForSlider.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Radharani Ribas-Valongo on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
import UIKit

struct ColorsForSlider {
    var red: CGFloat = 1
    var green: CGFloat = 1
    var blue: CGFloat = 1
    var alpha: CGFloat = 1
    
    
    func getColor() -> UIColor {
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
    mutating func changeRed(red: CGFloat) {
        self.red = red
    }
    
    mutating func changeBlue(blue: CGFloat) {
        self.blue = blue
    }
    
    
    mutating func changeGreen(green: CGFloat) {
        self.green = green
    }
    
    mutating func changeAlpha(alpha: CGFloat) {
        self.alpha = alpha
    }
}
