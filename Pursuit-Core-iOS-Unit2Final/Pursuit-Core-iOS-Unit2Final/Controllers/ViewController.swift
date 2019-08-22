//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: -- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: -- Properties
    let crayonList = Crayon.allTheCrayons
    
    //MARK: -- Segue method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifer = segue.identifier else {fatalError("No identifier in segue")}
        
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
            fatalError("unexpected segue identifier")
        }
    }
    
    //MARK: -- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

//MARK: -- Table Datasource Methods
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
        
        if cell.detailTextLabel?.text == "#000000" {
            cell.textLabel?.textColor = .white
            cell.detailTextLabel?.textColor = .white
        } else {
            cell.textLabel?.textColor = .black
            cell.detailTextLabel?.textColor = .black
        }
        
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.0)
        cell.selectedBackgroundView = selectedView
        return cell
    }
}

//MARK: -- Table Delegate Methods
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
