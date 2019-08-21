//
//  Crayon.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import Foundation

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
}
