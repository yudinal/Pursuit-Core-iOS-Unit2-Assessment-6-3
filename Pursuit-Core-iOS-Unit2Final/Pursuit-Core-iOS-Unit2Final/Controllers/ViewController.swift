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
    var crayons: [Crayon]!
    
    
    //MARK: TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        cell.textLabel?.text = crayons[indexPath.row].name
        cell.detailTextLabel?.text = crayons[indexPath.row].hex
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(crayons[indexPath.row].red), green: CGFloat(crayons[indexPath.row].green), blue: CGFloat(crayons[indexPath.row].blue), alpha: 1.0)
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
        ColorChangeVC.blue = crayons[selectedIndexPath.row].blue
        ColorChangeVC.green = crayons[selectedIndexPath.row].green
        ColorChangeVC.red = crayons[selectedIndexPath.row].red
        ColorChangeVC.currentColorName = crayons[selectedIndexPath.row].name

    }
    
    

    
    
    //MARK: Lifecycle Methods
    
  override func viewDidLoad() {
    tableViewOut.delegate = self
    tableViewOut.dataSource = self
    crayons = Crayon.convertToCG()
//    print(crayons)
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }


}



///extraCredit sudo:

//if greenSlider && redSlider && blueSlider values are below 0.35 change textlabels to white or lighter color, create a function to do so.
//
 

 

