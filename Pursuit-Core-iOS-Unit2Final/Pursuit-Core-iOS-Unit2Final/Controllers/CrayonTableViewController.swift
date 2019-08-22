//
//  CrayonTableViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Michelle Cueva on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CrayonTableViewController: UITableViewController {
    
    var allCrayons:[Crayon]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getCrayonInfo()
    }
    
    func getCrayonInfo() {
        let allItems = Crayon.allTheCrayons
        allCrayons = allItems
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCrayons.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let crayon = allCrayons[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
       
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.backgroundColor = crayon.getUIColor()
        
        if cell.backgroundColor == Crayon.getBlack() {
            cell.textLabel?.textColor = UIColor.white
            cell.detailTextLabel?.textColor = UIColor.white
        }

        return cell
    }
 
    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let DetailVC = segue.destination as? DetailViewController else {
            fatalError("Unexpected segue VC")
            
        }
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else {fatalError("No row selected")
        }
        
        let currentCrayon = allCrayons[selectedIndexPath.row]
        
        DetailVC.crayon = currentCrayon

    }

}
