//
//  MainViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var crayonPalettes = Crayon.allTheCrayons
    
    @IBOutlet weak var firstTableView: UITableView!
    
    

  override func viewDidLoad() {
    super.viewDidLoad()
    firstTableView.dataSource = self
    
  }
}
extension MainViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayonPalettes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CrayonCell", for: indexPath)
        
        let crayonInCell = crayonPalettes[indexPath.row]
        
        cell.textLabel?.text = crayonInCell.name
        cell.detailTextLabel?.text = crayonInCell.hex
        cell.backgroundColor = UIColor (displayP3Red: CGFloat(crayonInCell.red/255), green: CGFloat(crayonInCell.green/255), blue: CGFloat(crayonInCell.blue/255), alpha: 1)
    return cell
    }
    
    
}
