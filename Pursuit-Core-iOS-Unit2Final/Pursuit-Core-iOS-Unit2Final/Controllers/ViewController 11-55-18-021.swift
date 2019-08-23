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
    
    
    
    var color = Crayon.allTheCrayons
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return color.count
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell") as? colorsTableViewCell else { return UITableViewCell()}
        let currentColor = color[indexPath.row]
        cell.nameOfColorLabel.text = currentColor.name
        cell.hexLabel.text = currentColor.hex
        cell.backgroundColor = UIColor.init(red: CGFloat(currentColor.red)/255, green: CGFloat(currentColor.green)/255, blue: CGFloat(currentColor.blue)/255, alpha: 1)
        return cell
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let segueIdentifer = segue.identifier else {fatalError("No indentifier in segue")}
        
        switch segueIdentifer {
            
        case "SegToDescription":
            guard let destVC = segue.destination as? DetailedViewController else {
                fatalError("Unexpected segue VC")
            }
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {fatalError("No row selected")
            }
            let currentCrayon = color[selectedIndexPath.row]
            destVC.currentCrayon = currentCrayon
            
            
        default:
            fatalError("unexpected segue identifies")
            
        }
    }
}


