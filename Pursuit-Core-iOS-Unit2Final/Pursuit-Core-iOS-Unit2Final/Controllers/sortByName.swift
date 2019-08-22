//
//  sortByName.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Anthony Gonzalez on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
import UIKit


func sortByNameAscending(crayonArrayToSort: [Crayon]) -> [Crayon] {
    var sortedCrayonsInFunction = crayonArrayToSort
    sortedCrayonsInFunction = crayonArrayToSort.sorted(by: {$0.name < $1.name})
    return sortedCrayonsInFunction
}


func sortByNameDescending(crayonArrayToSort: [Crayon]) -> [Crayon] {
    var sortedCrayonsInFunction = crayonArrayToSort
    sortedCrayonsInFunction = crayonArrayToSort.sorted(by: {$0.name > $1.name})
    return sortedCrayonsInFunction
}


