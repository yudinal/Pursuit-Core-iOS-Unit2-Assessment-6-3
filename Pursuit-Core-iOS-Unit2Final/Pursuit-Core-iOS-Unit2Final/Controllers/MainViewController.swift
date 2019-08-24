//
//  MainViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

//Changed VC's name, declared Variable, connected IBOutlet, conforming datasource for TableView

class MainViewController: UIViewController {
    
    private var crayonPalettes = Crayon.allTheCrayons
    
    @IBOutlet weak var firstTableView: UITableView!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    firstTableView.dataSource = self
    }

//Created a segue with a constant variable, to pass data to detail VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = firstTableView.indexPathForSelectedRow, let CrayonsDetailViewController = segue.destination as? CrayonsDetailViewController else {return}
        
        let crayonToDetail = crayonPalettes[indexPath.row]
        CrayonsDetailViewController.crayons = crayonToDetail
    }
}

//DataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayonPalettes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CrayonCell", for: indexPath)
        
        let crayonInCell = crayonPalettes[indexPath.row]
        
        cell.textLabel?.text = crayonInCell.name
        cell.detailTextLabel?.text = crayonInCell.hex
        cell.backgroundColor = crayonInCell.color()
        
        return cell
    }
    
    
}
