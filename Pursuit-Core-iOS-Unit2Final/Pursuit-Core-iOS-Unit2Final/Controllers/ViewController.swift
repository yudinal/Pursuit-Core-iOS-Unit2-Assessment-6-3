//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
  
  let crayons = Crayon.allTheCrayons
  
  @IBOutlet weak var boxTableView: UITableView!
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return crayons.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
      let boxColors = crayons[indexPath.row]
      cell.textLabel?.text = boxColors.name
      cell.detailTextLabel?.text = boxColors.hex
      cell.backgroundColor = UIColor(
    return cell
  }

  

  override func viewDidLoad() {
    super.viewDidLoad()
    boxTableView.delegate = self
    boxTableView.dataSource = self
  }


}

