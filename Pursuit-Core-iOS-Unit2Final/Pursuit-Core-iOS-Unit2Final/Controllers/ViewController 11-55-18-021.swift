//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
 
    
    let color = Crayon.allTheCrayons
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentColors = theColors[indexPath.section][indexPath.row]

        if  let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath) as? colorsTableViewCell {
            cell.nameOfColorLabel.text = currentColors.name
            cell.hexLabel.text = currentColors.hex
            
            return cell
        
    }
    
return UITableViewCell()
        
    }
 
    override func viewDidLoad() {
    super.viewDidLoad()
        
    tableView.delegate = self
    tableView.dataSource = self
    
    // Do any additional setup after loading the view, typically from a nib.
  }
    }


func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    guard let segueIdentifer = segue.identifier else {fatalError("No indentifier in segue")}
    
    switch segueIdentifer {
        
    case "segToDescription":
        guard let destVC = segue.destination as? DetailedTableViewCell else {
            fatalError("Unexpected segue VC")
        }
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else {fatalError("No row selected")
        }
        let currentColors = theColors[selectedIndexPath.section][selectedIndexPath.row]
        destVC.currentColors = currentColors
        
    default:
        fatalError("unexpected segue identifies")
        
    }
}

