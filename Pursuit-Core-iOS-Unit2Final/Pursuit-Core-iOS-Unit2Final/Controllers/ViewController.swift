//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class CrayonListViewController: UIViewController {
    
    @IBOutlet weak var crayonTableView: UITableView!
    
    let crayons = Crayon.allTheCrayons
    let defaultAlpha = Crayon.defaultAlpha
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
        self.crayonTableView.delegate = self
        self.crayonTableView.dataSource = self
  }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndex = crayonTableView.indexPathForSelectedRow else { fatalError("No cell was selected") }
        guard segue.identifier == "cellToDetailsSegue" else { fatalError("Unidentified segue") }
        guard let detailsVC = segue.destination as? DetailsViewController else { fatalError("No destination View Controller") }
        
        detailsVC.currentCrayon = crayons[selectedIndex.row]
    }

}

extension CrayonListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
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
        
        return cell
    }
    
}
