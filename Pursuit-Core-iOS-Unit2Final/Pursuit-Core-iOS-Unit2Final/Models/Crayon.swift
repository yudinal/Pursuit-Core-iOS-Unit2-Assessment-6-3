//
//  Crayon.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import Foundation
import UIKit

class Crayon {
    var name: String
    var red: Double
    var green: Double
    var blue: Double
    var hex: String
    init(name: String, red: Double, green: Double, blue: Double, hex: String) {
        self.name = name
        self.red = red
        self.green = green
        self.blue = blue
        self.hex = hex
    }
    
    ///Sets crayon color based on hex value
    convenience init(name: String, hex: String) {
        let hexValue = hex.replacingOccurrences(of: "#", with: "")
        var rgb: UInt32 = 0
        Scanner(string: hexValue).scanHexInt32(&rgb)
        let redValue = Double((rgb & 0xFF0000) >> 16)
        let greenValue = Double((rgb & 0x00FF00) >> 8)
        let blueValue =  Double(rgb & 0x0000FF)
        self.init(name: name, red: redValue, green: greenValue, blue: blueValue, hex: hex)
    }
    
    static let allTheCrayons = [
        Crayon(name: "Almond", red: 239, green: 222, blue: 205, hex: "#EFDECD"),
        Crayon(name: "Antique Brass", red: 205, green: 149, blue: 117, hex: "#CD9575"),
        Crayon(name: "Apricot", red: 253, green: 217, blue: 181, hex: "#FDD9B5"),
        Crayon(name: "Aquamarine", red: 120, green: 219, blue: 226, hex: "#78DBE2"),
        Crayon(name: "Asparagus", red: 135, green:  169, blue: 107, hex: "#87A96B"),
        Crayon(name: "Atomic Tangerine", red: 255, green: 164, blue: 116, hex: "#FFA474"),
        Crayon(name: "Banana Mania", red: 250, green: 231, blue: 181, hex: "#FAE7B5"),
        Crayon(name: "Beaver", red: 159, green: 129, blue:  112, hex: "#9F8170"),
        Crayon(name: "Bittersweet", red: 253, green: 124, blue: 110, hex: "#FD7C6E"),
        Crayon(name: "Black", red: 0, green: 0, blue: 0, hex: "#000000"),
        Crayon(name: "Blizzard Blue", red: 172, green: 229, blue: 238, hex: "#ACE5EE"),
        Crayon(name: "Blue", red: 31, green: 117, blue: 254, hex: "#1F75FE"),
        Crayon(name: "Blue Bell", red: 162, green: 162, blue: 208, hex: "#A2A2D0"),
        Crayon(name: "Blue Hosta", hex: "#77bfc7"),
        Crayon(name: "Blue Gray", red: 102, green: 153, blue: 204, hex: "#6699CC"),
        Crayon(name: "Blue Green", red: 13, green: 152, blue: 186, hex: "#0D98BA"),
        Crayon(name: "Blue Violet", red: 115, green: 102, blue: 189, hex: "#7366BD"),
        Crayon(name: "Cannabis Green", hex: "#059033"),
        Crayon(name: "Crystal Blue", hex: "#5cb3ff"),
        Crayon(name: "Exciting Excrement", hex: "#7a5901"),
        Crayon(name: "Jellyfish", hex: "#46c7c7"),
        Crayon(name: "Pikachu Yellow", hex: "#DCE73C"),
        Crayon(name: "Piña Colada", hex: "#f2d5a9"),
        Crayon(name: "Popcorn Ball", hex: "#fceacd"),
        Crayon(name: "Red Wine", hex: "#990012"),
        Crayon(name: "Ghost White", hex: "#f8f8ff"),
        Crayon(name: "Flamingo Pink", hex: "#F9A7B0"),
        Crayon(name: "Sunrise Orange", hex: "#e67451"),
        Crayon(name: "Shamrock Green", hex: "#347C17"),
        Crayon(name: "Pearl", hex: "#fdeef4"),
        Crayon(name: "Seashell", hex: "#fff5ee"),
        Crayon(name: "Milk White", hex: "#fefcff"),
        Crayon(name: "Lemon Zest", hex: "#fdd017"),
        Crayon(name: "Purple Mountain's Majesty", hex: "#9678b6"),
        Crayon(name: "Anthony's Skintone", hex: "#CF9D86")
    ]
}
