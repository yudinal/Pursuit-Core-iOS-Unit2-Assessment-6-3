//
//  ColorCellViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Levi Davis on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorCellViewController: UIViewController {
    
    let crayonBox = Crayon.allTheCrayons
    
    @IBOutlet weak var crayonTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        crayonTableView.delegate = self
        crayonTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let crayonVC = segue.destination as? ColorDetailViewController {
            guard let indexPath = crayonTableView.indexPathForSelectedRow,
                let detailVC = segue.destination as? ColorDetailViewController else {return}
            let crayon = crayonBox[indexPath.row]
            crayonVC.crayon = crayon
            detailVC.crayon = crayon
        }
    }

}

extension ColorCellViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayonBox.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = crayonTableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let oneCrayon = crayonBox[indexPath.row]
        
        cell.textLabel?.text = oneCrayon.name
        cell.detailTextLabel?.text = oneCrayon.hex
        cell.backgroundColor = UIColor(red: oneCrayon.red, green: oneCrayon.green, blue: oneCrayon.blue, alpha: oneCrayon.alpha)
        
        return cell
    }
    
}
