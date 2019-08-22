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
    convenience init(name: String, hex: String) {
        let arrayHex = Array(hex)
        let red = Crayon.hexToInteger(char1: arrayHex[1], char2: arrayHex[2])
        let green = Crayon.hexToInteger(char1: arrayHex[3], char2: arrayHex[4])
        let blue = Crayon.hexToInteger(char1: arrayHex[5], char2: arrayHex[6])
        self.init(name: name, red: red, green: green, blue: blue, hex: hex)
    }
    
    static let hexDict: [Character: Double] = [
        "0": 0,
        "1": 1,
        "2": 2,
        "3": 3,
        "4": 4,
        "5": 5,
        "6": 6,
        "7": 7,
        "8": 8,
        "9": 9,
        "A": 10,
        "B": 11,
        "C": 12,
        "D": 13,
        "E": 14,
        "F": 15,
    ]
    
    static func hexToInteger(char1: Character, char2: Character) -> Double {
        guard let intFirst = Crayon.hexDict[char1] else {
            fatalError("Not a Hex value")
        }
        guard let intLast = Crayon.hexDict[char2] else {
            fatalError("Not a Hex value")
        }
        return (intFirst * 16) + intLast
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
        Crayon(name: "Blue Gray", red: 102, green: 153, blue: 204, hex: "#6699CC"),
        Crayon(name: "Blue Green", red: 13, green: 152, blue: 186, hex: "#0D98BA"),
        Crayon(name: "Blue Violet", red: 115, green: 102, blue: 189, hex: "#7366BD"),
        Crayon(name: "Duron Sunrise", hex: "#FFCA7C")
    ]
    
    func getUIColor()-> UIColor {
        return UIColor(displayP3Red: CGFloat(self.red/255), green: CGFloat(self.green/255), blue: CGFloat(self.blue/255), alpha: 1)
    }
  
    static func getBlack() -> UIColor {
        return UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func getColor() -> Color {
        return Color(red: CGFloat(self.red/255), green: CGFloat(self.green/255), blue: CGFloat(self.blue/255), alpha: 1)
    }
}



