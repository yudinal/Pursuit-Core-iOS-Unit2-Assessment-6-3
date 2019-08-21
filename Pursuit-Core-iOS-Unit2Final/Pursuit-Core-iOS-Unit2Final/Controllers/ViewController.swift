//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class CrayonListViewController: UIViewController {
    // MARK: - Constants and Variables
    
    // Outlets
    @IBOutlet weak var crayonTableView: UITableView!
    
    let crayons = Crayon.allTheCrayons
    let defaultAlpha = Crayon.defaultAlpha
    
    
    // MARK: - Life Cycle functions
    override func viewDidLoad() {
    super.viewDidLoad()
        self.crayonTableView.delegate = self
        self.crayonTableView.dataSource = self
    }

    
    // MARK: - Navigation functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Guards for cell
        guard let selectedIndex = crayonTableView.indexPathForSelectedRow else { fatalError("No cell was selected") }
        // Guards for segue
        guard segue.identifier == "cellToDetailsSegue" else { fatalError("Unidentified segue") }
        // Guards for destination view controller
        guard let detailsVC = segue.destination as? DetailsViewController else { fatalError("No destination View Controller") }
        
        // Passes Crayon at selected cell to destination view controller
        detailsVC.currentCrayon = crayons[selectedIndex.row]
    }

}


// MARK: - Tableview extensions
extension CrayonListViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Sets number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    // Sets cell details
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crayon = crayons[indexPath.row]
        
        let redValue = crayon.convertCrayonValue(value: crayon.red)
        let greenValue = crayon.convertCrayonValue(value: crayon.green)
        let blueValue = crayon.convertCrayonValue(value: crayon.blue)
        let alphaValue = defaultAlpha

        let cell = crayonTableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.backgroundColor = UIColor(displayP3Red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
        
        let averageOfValues = (redValue + greenValue + blueValue + alphaValue)/4
        if Double(averageOfValues) < 0.5 {
            cell.textLabel?.textColor = UIColor.white
            cell.detailTextLabel?.textColor = UIColor.white
        } else {
            cell.detailTextLabel?.textColor = UIColor.black
        }
        
        return cell
    }
    
}
