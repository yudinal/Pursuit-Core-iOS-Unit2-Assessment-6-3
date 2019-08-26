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


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Crayon.allTheCrayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let color = crayola[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        cell.textLabel?.text = color.name
        cell.detailTextLabel?.text = color.hex
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(color.red/255), green: CGFloat(color.green/255), blue: CGFloat(color.blue/255), alpha: 1)
        return cell
    }
    
    
}
