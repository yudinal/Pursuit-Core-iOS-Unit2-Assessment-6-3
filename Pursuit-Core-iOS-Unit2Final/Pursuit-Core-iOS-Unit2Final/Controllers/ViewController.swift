//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var crayons: [Crayon]!
    
    @IBOutlet weak var tableViewOut: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        cell.textLabel?.text = crayons[indexPath.row].name
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(crayons[indexPath.row].red), green: CGFloat(crayons[indexPath.row].green), blue: CGFloat(crayons[indexPath.row].blue), alpha: 1.0)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    
    

    
    
    
  override func viewDidLoad() {
    tableViewOut.delegate = self
    tableViewOut.dataSource = self
    crayons = Crayon.convertToCG()
//    print(crayons)
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }


}

