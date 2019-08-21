//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   

   
    
    
    let theCrayons = Crayon.allTheCrayons
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
  
  }
    
    // number of sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Crayon.allTheCrayons.count
    }
    
   
    
    // populate cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
           
            // cell label
            cell.crayonLabel.text = Crayon.allTheCrayons[indexPath.row].name
            cell.crayonHexLabel.text = Crayon.allTheCrayons[indexPath.row].hex
            
            // This converts 255 RGB value to scaling 0.0 to 1.0 value
                let cellRed = (Crayon.allTheCrayons[indexPath.row].red)/255
                let cellGreen = (Crayon.allTheCrayons[indexPath.row].green)/255
                let cellBlue = (Crayon.allTheCrayons[indexPath.row].blue)/255
            
            // This converts 255 RGB value to scaling 0.0 to 1.0 value
            
            // cell background color
            cell.crayonLabel.backgroundColor = UIColor.init(red: CGFloat(cellRed), green: CGFloat(cellGreen), blue: CGFloat(cellBlue), alpha: 1)
            cell.crayonHexLabel.backgroundColor = UIColor.init(red: CGFloat(cellRed), green: CGFloat(cellGreen), blue: CGFloat(cellBlue), alpha: 1)
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }


}
