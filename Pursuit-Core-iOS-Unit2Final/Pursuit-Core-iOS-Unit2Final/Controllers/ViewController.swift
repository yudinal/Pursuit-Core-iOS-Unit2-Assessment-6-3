//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var crayola = Crayon.allTheCrayons
    
    @IBOutlet weak var colorTableView: UITableView!
   
    override func viewDidLoad() {
    super.viewDidLoad()
        colorTableView.delegate = self
        colorTableView.dataSource = self
  }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailedViewController = segue.destination as? DetailedColorViewController else {fatalError()}
        // this is going to show if the view controller is there or not.
        
        guard let selectedIndexPath = colorTableView.indexPathForSelectedRow else {fatalError()}
        // this is what will happen when the user selects on the row.
        
        detailedViewController.color = crayola[selectedIndexPath.row]
        // this transfers the data over to the detailed view controller. 
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Crayon.allTheCrayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = crayola[indexPath.row]
        // this is the instance of the model at each element
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        cell.textLabel?.text = color.name
        cell.detailTextLabel?.text = color.hex
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(color.red/255), green: CGFloat(color.green/255), blue: CGFloat(color.blue/255), alpha: 1)
        return cell
        // this is populating the cell by identifying it also it is filling the cell with the name of the color as the title and the hex value as the subtitle. this is happening due to diving the color by 255. 
    }
    
}
