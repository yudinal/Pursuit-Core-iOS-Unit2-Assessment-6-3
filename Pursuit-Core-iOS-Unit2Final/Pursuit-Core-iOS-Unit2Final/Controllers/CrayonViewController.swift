//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class CrayonViewController: UIViewController {
    @IBOutlet weak var crayonTableView: UITableView!
    
    let crayonBox = Crayon.allTheCrayons
    
  override func viewDidLoad() {
    super.viewDidLoad()
    crayonTableView.dataSource = self
    // Do any additional setup after loading the view, typically from a nib.
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController,let indexPath = crayonTableView.indexPathForSelectedRow else {return}
        destination.crayon = crayonBox[indexPath.row]
    }
}

extension CrayonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayonBox.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = crayonTableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        let theCrayon = crayonBox[indexPath.row]
        cell.textLabel?.text = theCrayon.name
        cell.detailTextLabel?.text = theCrayon.hex
        cell.backgroundColor = theCrayon.getUIColor()
        return cell
    }
}
