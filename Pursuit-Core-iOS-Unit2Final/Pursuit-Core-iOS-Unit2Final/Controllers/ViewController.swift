//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    let color = Crayon.allTheCrayons
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return color.count
    }
    
    //loads up tableview with cells with name, hex, and background color of cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "ourCell", for: indexPath)
        let colorNum = color[indexPath.row]
        cell.textLabel?.text = colorNum.name
        cell.detailTextLabel?.text = colorNum.hex
        cell.contentView.backgroundColor = UIColor.init(displayP3Red: CGFloat(colorNum.red / 255), green: CGFloat(colorNum.green / 255 ), blue: CGFloat(colorNum.blue / 255), alpha: 1)
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { fatalError("No identifier in segue") }
        
        switch segueIdentifier {
        case "colorSegway" :
            guard let colorVC = segue.destination as? ColorViewController else {
                fatalError("Unexpected segue VC")
            }
            guard let selectedIndexPath = tableViewOutlet.indexPathForSelectedRow else {
                fatalError("No row was selected")
            }
            //Sends background color and the name depending on row selected
            colorVC.view.backgroundColor = UIColor.init(displayP3Red: CGFloat(color[selectedIndexPath.row].red / 255), green: CGFloat(color[selectedIndexPath.row].green / 255 ), blue: CGFloat(color[selectedIndexPath.row].blue / 255), alpha: 1)
            colorVC.selectedCrayon.text? = color[selectedIndexPath.row].name
            
            //store value of selected crayon for reset button to reset back to this color
            colorVC.currentColor = UIColor.init(displayP3Red: CGFloat(color[selectedIndexPath.row].red / 255), green: CGFloat(color[selectedIndexPath.row].green / 255 ), blue: CGFloat(color[selectedIndexPath.row].blue / 255), alpha: 1)
        default:
            fatalError("Woops")
        }
    }
}
