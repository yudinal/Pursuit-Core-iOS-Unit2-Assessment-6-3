//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let crayonList = Crayon.allTheCrayons
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifer = segue.identifier else {fatalError("No indentifier in segue")}
        
        switch segueIdentifer {
        case "segueToDetail":
            guard let destVC = segue.destination as? DetailViewController else {
                fatalError("Unexpected segue VC")
            }
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {fatalError("No row selected")
            }
            let crayonToSegue = crayonList[selectedIndexPath.row]
            destVC.currentCrayon = crayonToSegue
        default:
            fatalError("unexpected segue identifies")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCrayon = crayonList[indexPath.row]
        let currentCrayonRedValue = CGFloat(currentCrayon.red/255)
        let currentCrayonBlueValue = CGFloat(currentCrayon.blue/255)
        let currentCrayonGreenValue = CGFloat(currentCrayon.green/255)
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        cell.textLabel?.text = currentCrayon.name
        cell.detailTextLabel?.text = currentCrayon.hex
        cell.backgroundColor = UIColor(displayP3Red: currentCrayonRedValue, green: currentCrayonGreenValue, blue: currentCrayonBlueValue, alpha: 1.0)
        return cell
    }
    
}
