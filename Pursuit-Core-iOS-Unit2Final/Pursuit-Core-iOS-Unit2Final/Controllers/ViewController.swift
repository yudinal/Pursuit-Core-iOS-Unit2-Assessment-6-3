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
    
    // NUMBER OF ROWS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    // CELL FOR ROW AT
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crayon = crayons[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "crayonColor") {
            
            if crayon.hex == "#000000" {
                cell.textLabel?.textColor = .white
                cell.detailTextLabel?.textColor = .white
            }
            
            cell.textLabel?.text = crayon.name
            cell.detailTextLabel?.text = "Hex Value: \(crayon.hex)"
            cell.backgroundColor = UIColor(red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1.0)
            
            
            return cell
        }
        return UITableViewCell()
    }
    
    
    // PREPARE FOR SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let segueIdentifier = segue.identifier else {
            fatalError("No identifier on segue")
        }
        
        switch segueIdentifier {
            
        case "CrayonDetail":
            
            guard let crayonDetail = segue.destination as? DetailViewController else {
                fatalError("Unexpected segue VC")
            }
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
                fatalError("No row was selected")
            }
            crayonDetail.crayon = crayons[selectedIndexPath.row]
       
        default:
            fatalError("Unexpected segue identifier")
        }
    }
    
}
