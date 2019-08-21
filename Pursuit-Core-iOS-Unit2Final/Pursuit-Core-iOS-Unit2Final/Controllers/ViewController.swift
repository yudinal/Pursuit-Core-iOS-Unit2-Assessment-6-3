//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class CrayonBoxViewController: UIViewController {
  
  //MARK: -- Outlet
 
  @IBOutlet weak var crayonBoxTableView: UITableView!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    crayonBoxTableView.delegate = self
    crayonBoxTableView.dataSource = self
    // Do any additional setup after loading the view, typically from a nib.
  }


}

  var crayonColorArr = Crayon.allTheCrayons

extension CrayonBoxViewController: UITableViewDataSource {

  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return crayonColorArr.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let crayonCell = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath) as? CrayonCell else { return UITableViewCell() }
    
    let crayonBox = crayonColorArr[indexPath.row]
    crayonCell.textLabel?.text = crayonBox.name
    crayonCell.detailTextLabel?.text = crayonBox.hex
    crayonCell.backgroundColor = UIColor(displayP3Red: CGFloat(crayonBox.red / 255), green: CGFloat(crayonBox.green / 255), blue: CGFloat(crayonBox.blue / 255), alpha: 1.0)
    return crayonCell
  }
}

extension CrayonBoxViewController: UITableViewDelegate {
  
  
}


