//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let crayons = Crayon.allTheCrayons
    
    @IBOutlet weak var tableView: UITableView!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
  }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crayon = crayons[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "crayonColor") {
            
            cell.textLabel?.text = crayon.name
            cell.detailTextLabel?.text = "Hex Value: \(crayon.hex)"
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
