//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class CrayonListViewController: UIViewController {

    let crayons = Crayon.allTheCrayons
    
    @IBOutlet weak var crayonTableView: UITableView!
    
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
        let cell = crayonTableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1)
        
        return cell
    }
    
}
