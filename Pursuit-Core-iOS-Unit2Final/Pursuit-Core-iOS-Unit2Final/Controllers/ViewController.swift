//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Anthony on 08/21/19.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: -- Properties
    var crayonList = Crayon.allTheCrayons
    //MARK: -- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: --IBActions
    @IBAction func sortedButtonPressed(_ sender: UIBarButtonItem) {
        switch sender.title{
        case "Sort A-Z":
            crayonList = sortByNameAscending(crayonArrayToSort: crayonList)
            sender.title = "Sort Z-A"
            tableView.reloadData()
            
        case "Sort Z-A":
            crayonList = sortByNameDescending(crayonArrayToSort: crayonList)
            sender.title = "Sort A-Z"
            tableView.reloadData()
            
        default: ()
            
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard let createCrayonVC = segue.source as? CreateCrayonColorViewController else {
            fatalError("Unknown segue source")
        }
        
        if let crayonName = createCrayonVC.nameTextField.text?.capitalized,
            let hexStr = createCrayonVC.hexTextField.text?.uppercased(){
            let newCrayon = Crayon(name: crayonName, hex: "#\(hexStr)")
            crayonList.append(newCrayon)
            let lastRow = tableView.numberOfRows(inSection: 0)
            let lastIndexPath = IndexPath(row: lastRow, section: 0)
            tableView.insertRows(at: [lastIndexPath], with: .automatic)
            crayonList = sortByNameAscending(crayonArrayToSort: crayonList)
            tableView.reloadData()
        }
    }
    
    
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
            
        case "segueToAdd": ()
            
        default:
            fatalError("unexpected segue identifier")
        }
    }
    
    
    //MARK: -- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        crayonList = sortByNameAscending(crayonArrayToSort: crayonList)
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
        let currentCrayonGreenValue = CGFloat(currentCrayon.green/255)
        let currentCrayonBlueValue = CGFloat(currentCrayon.blue/255)
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        cell.textLabel?.text = currentCrayon.name; cell.detailTextLabel?.text = currentCrayon.hex
        cell.backgroundColor = UIColor(displayP3Red: currentCrayonRedValue, green: currentCrayonGreenValue, blue: currentCrayonBlueValue, alpha: 1.0)
        
        if cell.detailTextLabel?.text == "#000000" || cell.detailTextLabel?.text == "#990012" {
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
        return 105
    }
}
