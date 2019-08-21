//
//  CrayonsViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Mariel Hoepelman on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//
import Foundation
import UIKit

class CrayonsViewController: UIViewController {
    
    var crayons = Crayon.allTheCrayons
    @IBOutlet weak var crayonNameLabel: UILabel!
    @IBOutlet weak var crayonHexValueLabel: UILabel!

    @IBOutlet weak var CrayonsTableVIew: UITableView!
    @IBOutlet weak var crayonCell: UITableViewCell!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CrayonsTableVIew.delegate = self
        CrayonsTableVIew.dataSource = self
    }
}

extension CrayonsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        let crayon = crayons[indexPath.row]
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
//        cell.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red), green: CGFloat(crayon.green), blue: CGFloat(crayon.blue), alpha: 1.0)
         return cell
    }
}

extension CrayonsViewController: UITableViewDelegate {
    
}


