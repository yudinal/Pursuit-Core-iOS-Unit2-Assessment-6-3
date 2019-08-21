//
//  CrayonsViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Mariel Hoepelman on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//
import Foundation
import UIKit

class CrayonsViewController: UIViewController {
    
    var crayons = Crayon.allTheCrayons
    @IBOutlet weak var CrayonsTableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CrayonsTableVIew.delegate = self
        CrayonsTableVIew.dataSource = self
    }
    
    func showNotFoundAlert(titleType: String) -> Void {
        let alert = UIAlertController(title: "\(titleType) not found!", message: "Please try again", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let crayonDetailedViewController = segue.destination as? CrayonsDetailedViewController else {
            return showNotFoundAlert(titleType: "row")
        }
        guard let selectedIndexPath = CrayonsTableVIew.indexPathForSelectedRow else {
            return showNotFoundAlert(titleType: "row")
        }
        let crayon = Crayon.allTheCrayons
        crayonDetailedViewController.crayon = crayon[selectedIndexPath.row]
        print(crayonDetailedViewController.crayon.name)
    }
}

extension CrayonsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        let crayon = crayons[indexPath.row]
        cell.textLabel?.text = crayon.name
        cell.detailTextLabel?.text = crayon.hex
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red/255), green: CGFloat(crayon.green/255), blue: CGFloat(crayon.blue/255), alpha: 1.0)
         return cell
    }
}

extension CrayonsViewController: UITableViewDelegate {
    
}


