//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ColorTableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var crayons = Crayon.allTheCrayons
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard segue.identifier == "showPaletteSegue" else {return}
        guard let settingsVC = segue.destination as? PaletteViewController else {return}
        
        settingsVC.crayonChoice = crayons[indexPath.row]
    }
    
}

extension ColorTableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chosenCrayon = crayons[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        let redVal: CGFloat = CGFloat(chosenCrayon.red / 255)
        let greenVal: CGFloat = CGFloat(chosenCrayon.green / 255)
        let blueVal: CGFloat = CGFloat(chosenCrayon.blue / 255)
        
        let color = UIColor(red: redVal, green: greenVal, blue: blueVal, alpha: 1.0)
        
        cell.textLabel?.text = chosenCrayon.name
        cell.detailTextLabel?.text = chosenCrayon.hex
        
        cell.contentView.backgroundColor = color
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
