//
//  sortByName.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Anthony on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation
import UIKit


func sortByNameAscending(crayonArrayToSort: [Crayon]) -> [Crayon] {
    var sortedCrayons = crayonArrayToSort
    sortedCrayons = crayonArrayToSort.sorted(by: {$0.name < $1.name})
    return sortedCrayons
}


func sortByNameDescending(crayonArrayToSort: [Crayon]) -> [Crayon] {
    var sortedCrayons = crayonArrayToSort
    sortedCrayons = crayonArrayToSort.sorted(by: {$0.name > $1.name})
    return sortedCrayons
}


