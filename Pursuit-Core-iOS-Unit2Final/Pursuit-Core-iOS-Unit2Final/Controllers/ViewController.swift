//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var crayonTableView: UITableView!
    
    let crayons = Crayon.allTheCrayons
    
    override func viewDidLoad() {
    super.viewDidLoad()
    crayonTableView.delegate = self
        crayonTableView.dataSource = self
  }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crayon = crayons[indexPath.row]
        let cell = crayonTableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = String(crayon.hex)
        cell.backgroundColor = UIColor(red: CGFloat(crayon.red)/255, green: CGFloat(crayon.green)/255, blue: CGFloat(crayon.blue)/255, alpha: 1)
        return cell
    }
    
    
}

