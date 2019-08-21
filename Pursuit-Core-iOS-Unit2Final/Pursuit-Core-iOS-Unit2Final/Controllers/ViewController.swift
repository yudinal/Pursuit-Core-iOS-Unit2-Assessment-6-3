//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableCellOut: UITableView!
    var crayonTable = Crayon.allTheCrayons
    override func viewDidLoad() {
        super.viewDidLoad()
        tableCellOut.delegate = self
        tableCellOut.dataSource = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { fatalError("No identifier in segue") }
        switch segueIdentifier {
        case "toDesign":
            guard let crayon = segue.destination as? ColorViewController else {
                fatalError("Unexpected segue VC")
            }
            guard let selectedIndexPath = tableCellOut.indexPathForSelectedRow else {
                fatalError("No row was selected")
            }
            let color = crayonTable[selectedIndexPath.row]
            crayon.crayonColor = color
        default:
            fatalError("Unexpected segue identifier")
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayonTable.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableCellOut.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        let selected = crayonTable[indexPath.row]
        cell.textLabel?.text = selected.name
        cell.detailTextLabel?.text =  selected.hex
        cell.backgroundColor = selected.changeValue()
        return cell
    }
    
}

