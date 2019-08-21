//
//  ColorChanging.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Anthony Gonzalez on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
import UIKit

struct ColorChanging {
    var red: CGFloat = 0.5
    var green: CGFloat = 0.5
    var blue: CGFloat = 0.5
    
    
    func getColor() -> UIColor {
        return UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1.0)
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
    
}
