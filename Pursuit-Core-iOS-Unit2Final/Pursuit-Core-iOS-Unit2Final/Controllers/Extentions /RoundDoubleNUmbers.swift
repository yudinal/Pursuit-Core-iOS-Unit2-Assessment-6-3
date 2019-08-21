//
//  File.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Michelle Cueva on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

extension Double {
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
