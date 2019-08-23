//
//  CrayonListViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Aaron Pachesa on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CrayonListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var crayons = Crayon.allTheCrayons

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MasterToDetail" {
            let destVC = segue.destination as! DetailViewController
            destVC.crayon = sender as? Crayon
        }
    }

}

extension CrayonListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crayon = crayons[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell") as! CrayonCell
        cell.setCrayon(crayon: crayon)
        
        for i in 0...15 {
            if indexPath.row == i {
                cell.backgroundColor = UIColor(red: CGFloat(crayon.red / 255), green: CGFloat(crayon.green / 255), blue: CGFloat(crayon.blue/255), alpha: 1.0)
            }
        }
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let crayon = crayons[indexPath.row]
        performSegue(withIdentifier: "MasterToDetail", sender: crayon)
    }
}
