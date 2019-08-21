//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    let color = Crayon.allTheCrayons
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return color.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "ourCell", for: indexPath)
        
        cell.textLabel?.text = color[indexPath.row].name
        cell.detailTextLabel?.text = color[indexPath.row].hex
        cell.contentView.backgroundColor = UIColor.init(red: CGFloat(color[indexPath.row].red), green: CGFloat(color[indexPath.row].green), blue: CGFloat(color[indexPath.row].blue), alpha: 10)
        return cell
    }
    
    

  override func viewDidLoad() {
    super.viewDidLoad()
    tableViewOutlet.delegate = self
    tableViewOutlet.dataSource = self
    // Do any additional setup after loading the view, typically from a nib.
  }


}

