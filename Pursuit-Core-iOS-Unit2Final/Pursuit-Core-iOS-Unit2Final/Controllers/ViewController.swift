//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    //MARK: Outlets & Variables
    
    @IBOutlet weak var tableViewOut: UITableView!
    var crayons = Crayon.allTheCrayons
    
    
    //MARK: TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        let crayon = crayons[indexPath.row]
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.backgroundColor = crayon.getColor()
        return cell }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90 }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 }
    
    
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier != nil else { fatalError("No identifier in segue") }
        guard let ColorChangeVC = segue.destination as? ColorChangeViewController
            else { fatalError("Unexpected segue")}
        guard let selectedIndexPath = tableViewOut.indexPathForSelectedRow
            else { fatalError("No row selected") }
        ColorChangeVC.colorFromVC = crayons[selectedIndexPath.row]

    }
    
    

    
    
    //MARK: Lifecycle Methods
    
  override func viewDidLoad() {
    tableViewOut.delegate = self
    tableViewOut.dataSource = self
    Crayon.converted()
    super.viewDidLoad()
  }


}

 

 

