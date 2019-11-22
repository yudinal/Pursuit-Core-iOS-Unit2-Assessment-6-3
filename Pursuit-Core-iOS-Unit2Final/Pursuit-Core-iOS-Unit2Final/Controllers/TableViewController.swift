//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var crayons = Crayon.allTheCrayons
    
    var colors = Float() {
        didSet {
            tableView.reloadData()
        }
    }
    
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
  }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let crayonDC = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        let crayon = crayons[indexPath.row]
        crayonDC.crayons = crayon
        colors = Float(crayonDC.color)
    }
}


extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        let crayon = crayons[indexPath.row]
        cell.textLabel!.text = crayon.name
        cell.detailTextLabel!.text = crayon.hex
        
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red / 255), green: CGFloat(crayon.green / 255), blue: CGFloat(crayon.blue / 255), alpha: 1.0)
        
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red / 255), green: CGFloat(crayon.green / 255), blue: CGFloat(crayon.blue / 255), alpha: 1.0)
        
        

        return cell
    }
}
