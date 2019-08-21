//
//  File.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Michelle Cueva on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
import UIKit

struct Color {
    
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    var alpha: CGFloat
    
    
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

