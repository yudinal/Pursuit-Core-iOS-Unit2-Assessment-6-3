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
  var red: CGFloat
  var green: CGFloat
  var blue: CGFloat
    var alpha:CGFloat
  var hex: String
    init(name: String, red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat, hex: String) {
    self.name = name
    self.red = red
    self.green = green
    self.blue = blue
        self.alpha = alpha
    self.hex = hex
  }
  static let allTheCrayons = [
    Crayon(name: "Almond", red: 239/255, green: 222/255, blue: 205/255, alpha: 255/255, hex: "#EFDECD"),
    Crayon(name: "Antique Brass", red: 205/255, green: 149/255, blue: 117/255, alpha: 255/255, hex: "#CD9575"),
    Crayon(name: "Apricot", red: 253/255, green: 217/255, blue: 181/255, alpha: 255/255, hex: "#FDD9B5"),
    Crayon(name: "Aquamarine", red: 120/255, green: 219/255, blue: 226/255, alpha: 255/255, hex: "#78DBE2"),
    Crayon(name: "Asparagus", red: 135/255, green:  169/255, blue: 107/255, alpha: 255/255, hex: "#87A96B"),
    Crayon(name: "Atomic Tangerine", red: 255/255, green: 164/255, blue: 116/255, alpha: 255/255, hex: "#FFA474"),
    Crayon(name: "Banana Mania", red: 250/255, green: 231/255, blue: 181/255, alpha: 255/255, hex: "#FAE7B5"),
    Crayon(name: "Beaver", red: 159/255, green: 129/255, blue:  112/255, alpha: 255/255, hex: "#9F8170"),
    Crayon(name: "Bittersweet", red: 253/255, green: 124/255, blue: 110/255, alpha: 255/255, hex: "#FD7C6E"),
    Crayon(name: "Black", red: 0/255, green: 0/255, blue: 0/255, alpha: 255/255, hex: "#000000"),
    Crayon(name: "Blizzard Blue", red: 172/255, green: 229/255, blue: 238/255, alpha: 255/255, hex: "#ACE5EE"),
    Crayon(name: "Blue", red: 31/255, green: 117/255, blue: 254/255, alpha: 255/255, hex: "#1F75FE"),
    Crayon(name: "Blue Bell", red: 162/255, green: 162/255, blue: 208/255, alpha: 255/255, hex: "#A2A2D0"),
    Crayon(name: "Blue Gray", red: 102/255, green: 153/255, blue: 204/255, alpha: 255/255, hex: "#6699CC"),
    Crayon(name: "Blue Green", red: 13/255, green: 152/255, blue: 186/255, alpha: 255/255, hex: "#0D98BA"),
    Crayon(name: "Blue Violet", red: 115/255, green: 102/255, blue: 189/255, alpha: 255/255, hex: "#7366BD")
  ]

}
    

