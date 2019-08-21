//
//  MainViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Pursuit on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
     var allCrayons = Crayon.allTheCrayons
    
    
    @IBOutlet weak var displayColorView: UITableView!
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return allCrayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
       
        var singleCrayon = allCrayons[indexPath.row]
        cell.detailTextLabel?.text = singleCrayon.hex
        cell.textLabel?.text = singleCrayon.name
        cell.backgroundColor = singleCrayon.displayAllColors()
        
        return cell
        
       
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayColorView.delegate = self
        displayColorView.dataSource = self

    }
    

   
}
