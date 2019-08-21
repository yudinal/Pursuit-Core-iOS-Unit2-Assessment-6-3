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
        let colorNum = color[indexPath.row]
        cell.textLabel?.text = colorNum.name
        cell.detailTextLabel?.text = colorNum.hex
        cell.contentView.backgroundColor = UIColor.init(displayP3Red: CGFloat(colorNum.red / 255), green: CGFloat(colorNum.green / 255 ), blue: CGFloat(colorNum.blue / 255), alpha: 1)
        return cell
    }
    
    

  override func viewDidLoad() {
    super.viewDidLoad()
    tableViewOutlet.delegate = self
    tableViewOutlet.dataSource = self
    // Do any additional setup after loading the view, typically from a nib.
  }


}

