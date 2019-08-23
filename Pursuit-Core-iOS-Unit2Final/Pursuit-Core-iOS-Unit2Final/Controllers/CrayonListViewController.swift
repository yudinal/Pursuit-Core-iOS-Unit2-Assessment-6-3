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
        
//        if indexPath.row == 0 {
//            cell.backgroundColor = UIColor(red: 239/255, green: 222/255, blue: 205/255, alpha: 1.0)
//        }
//        if indexPath.row == 1 {
//            cell.backgroundColor = UIColor(red: 205/255, green: 149/255, blue: 117/255, alpha: 1.0)
//        }
//        if indexPath.row == 2 {
//            cell.backgroundColor = UIColor(red: 253/255, green: 217/255, blue: 181/255, alpha: 1.0)
//        }
//        if indexPath.row == 3 {
//            cell.backgroundColor = UIColor(red: 120/255, green: 219/255, blue: 226/255, alpha: 1.0)
//        }
//        if indexPath.row == 4 {
//            cell.backgroundColor = UIColor(red: 135/255, green: 169/255, blue: 107/255, alpha: 1.0)
//        }
//        if indexPath.row == 5 {
//            cell.backgroundColor = UIColor(red: 255/255, green: 164/255, blue: 116/255, alpha: 1.0)
//        }
//        if indexPath.row == 6 {
//            cell.backgroundColor = UIColor(red: 250/255, green: 231/255, blue: 181/255, alpha: 1.0)
//        }
//        if indexPath.row == 7 {
//            cell.backgroundColor = UIColor(red: 159/255, green: 129/255, blue: 112/255, alpha: 1.0)
//        }
//        if indexPath.row == 8 {
//            cell.backgroundColor = UIColor(red: 253/255, green: 124/255, blue: 110/255, alpha: 1.0)
//        }
//        if indexPath.row == 9 {
//            cell.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
//        }
//        if indexPath.row == 10 {
//            cell.backgroundColor = UIColor(red: 172/255, green: 229/255, blue: 238/255, alpha: 1.0)
//        }
//        if indexPath.row == 11 {
//            cell.backgroundColor = UIColor(red: 31/255, green: 117/255, blue: 254/255, alpha: 1.0)
//        }
//        if indexPath.row == 12 {
//            cell.backgroundColor = UIColor(red: 162/255, green: 162/255, blue: 208/255, alpha: 1.0)
//        }
//        if indexPath.row == 13 {
//            cell.backgroundColor = UIColor(red: 102/255, green: 153/255, blue: 204/255, alpha: 1.0)
//        }
//        if indexPath.row == 14 {
//            cell.backgroundColor = UIColor(red: 13/255, green: 152/255, blue: 186/255, alpha: 1.0)
//        }
//        if indexPath.row == 15 {
//            cell.backgroundColor = UIColor(red: 115/255, green: 102/255, blue: 189/255, alpha: 1.0)
//        }
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let crayon = crayons[indexPath.row]
        performSegue(withIdentifier: "MasterToDetail", sender: crayon)
    }
}
