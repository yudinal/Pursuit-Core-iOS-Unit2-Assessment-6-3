//
//  ColorCellViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Levi Davis on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorCellViewController: UIViewController, ColorChangeDelegate {
    
    let crayonBox = Crayon.allTheCrayons
    var newColor = UIColor()
    
    
    
    @IBOutlet weak var crayonTableView: UITableView!
    
    func getNewColor(red: CGFloat, blue: CGFloat, green: CGFloat) {
        newColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        crayonTableView.delegate = self
        crayonTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let crayonVC = segue.destination as? ColorDetailViewController {
            guard let indexPath = crayonTableView.indexPathForSelectedRow,
                let detailVC = segue.destination as? ColorDetailViewController else {return}
            let crayon = crayonBox[indexPath.row]
            crayonVC.delegate = self
            crayonVC.crayon = crayon
            detailVC.crayon = crayon
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
        cell.backgroundColor = UIColor(red: oneCrayon.red, green: oneCrayon.green, blue: oneCrayon.blue, alpha: 1.0)
        
        
        return cell
    }
    
}
