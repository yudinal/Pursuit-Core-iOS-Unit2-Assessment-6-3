//
//  CrayonTableViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Jason Ruan on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CrayonTableViewController: UITableViewController {
    
    let crayons = Crayon.allTheCrayons
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Crayon.allTheCrayons.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Taste the Rainbow"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //creates an instance of the corresponding crayon object
        let currentCrayon = crayons[indexPath.row]
        let red = CGFloat(currentCrayon.red / 255)
        let green = CGFloat(currentCrayon.green / 255)
        let blue = CGFloat(currentCrayon.blue / 255)
        
        //populates cells with info from respective crayon
        let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        cell.textLabel?.text = currentCrayon.name
        cell.detailTextLabel?.text = currentCrayon.hex
        cell.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1)
        
        //changes color of labels' texts
        adjustTextColor(cell: cell, red: red, green: green, blue: blue)
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { fatalError("Could not find identifier") }
        
        switch segueIdentifier {
        case "crayonDetailSegue":
            guard let detailsVC = segue.destination as? DetailCrayonViewController else { fatalError("Could not make DetailCrayonViewController the destination") }
            if let selectedIndexPath = self.tableView.indexPathForSelectedRow{
                detailsVC.crayon = crayons[selectedIndexPath.row]
            }
        default:
            break
        }
    }
    
    // MARK: -- Custom Methods
    func adjustTextColor(cell: UITableViewCell, red: CGFloat, green: CGFloat, blue: CGFloat) {
        if red + green + blue < 2 {
            cell.textLabel?.textColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 1)
            cell.detailTextLabel?.textColor = UIColor(displayP3Red: 1, green: 1, blue: 1, alpha: 1)
        } else {
            cell.textLabel?.textColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
            cell.detailTextLabel?.textColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    
}
