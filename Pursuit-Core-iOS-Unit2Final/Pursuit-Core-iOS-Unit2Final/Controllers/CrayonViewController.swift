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
    
    let crayons = Crayon.allTheCrayons
    
    override func viewDidLoad() {
    super.viewDidLoad()
        view.backgroundColor = .black
    crayonTableView.delegate = self
        crayonTableView.dataSource = self
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? CrayonDetailViewController,
            let indexPath = crayonTableView.indexPathForSelectedRow else {return}
        let selectedCrayon = crayons[indexPath.row]//cellSelected is indexPath
        
        
        destination.crayon = selectedCrayon
    }
}


extension CrayonViewController: UITableViewDelegate, UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Crayon Colors"
    }
    
}

