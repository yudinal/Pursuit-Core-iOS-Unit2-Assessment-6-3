//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    let color = Crayon.allTheCrayons
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return color.count
    }
    
    

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell") as? colorsTableViewCell else { return UITableViewCell()}
            let currentColor = color[indexPath.row]
        cell.backgroundColor = UIColor.init(red: CGFloat(currentColor.red)/255, green: CGFloat(currentColor.green)/255, blue: CGFloat(currentColor.blue)/255, alpha: 1)
        return cell
                
    
        
    }
    
    

    override func viewDidLoad() {
    super.viewDidLoad()
        
    tableView.delegate = self
    tableView.dataSource = self
 
  }
    }

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

//func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    guard let segueIdentifer = segue.identifier else {fatalError("No indentifier in segue")}
//
//    switch segueIdentifer {
//
//    case "segToDescription":
//        guard segue.destination is DetailedTableViewCell else {
//            fatalError("Unexpected segue VC")
//        }
//        guard let selectedIndexPath = UITableView.indexPathForSelectedRow else {fatalError("No row selected")
//        }
//        let currentColors = theColors[selectedIndexPath.section][selectedIndexPath.row]
//        destVC.currentColors = currentColors
//
//    default:
//        fatalError("unexpected segue identifies")
//
//    }
//}

