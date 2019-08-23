//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let theCrayons = Crayon.allTheCrayons
    
    @IBOutlet weak var tableView: UITableView!
    
    // this loads the view
  override func viewDidLoad() {
    super.viewDidLoad()
  }
    
    // number of sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Crayon.allTheCrayons.count
    }
    
    // prepares the segue to the DetailVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController else {return}
        if segue.identifier == "detailSegue" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let crayon = theCrayons[indexPath.row]
            destination.daCrayons = crayon
                }
    }
    
    // populate cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
           
            // cell label
            cell.crayonLabel.text = theCrayons[indexPath.row].name
            cell.crayonHexLabel.text = theCrayons[indexPath.row].hex
            
            // This converts 255 RGB value to scaling 0.0 to 1.0 value
                let cellRed = Double((theCrayons[indexPath.row].red)/255)
                let cellGreen = Double((theCrayons[indexPath.row].green)/255)
                let cellBlue = Double((theCrayons[indexPath.row].blue)/255)
            
            // cell background color
            cell.crayonLabel.backgroundColor = UIColor.init(red: CGFloat(cellRed), green: CGFloat(cellGreen), blue: CGFloat(cellBlue), alpha: 1)
            cell.crayonHexLabel.backgroundColor = UIColor.init(red: CGFloat(cellRed), green: CGFloat(cellGreen), blue: CGFloat(cellBlue), alpha: 1)
            
            return cell
        }
        return UITableViewCell()
    }
    
    // this sets the height of the cell to a solid 80 pixels
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }



} // class closing squiggly bracket
