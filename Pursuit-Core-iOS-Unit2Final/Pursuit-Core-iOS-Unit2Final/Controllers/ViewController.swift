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
      cell.backgroundColor = hexToRGB(hex: boxColors.hex)
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 65
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    boxTableView.delegate = self
    boxTableView.dataSource = self
  }


}

func hexToRGB (hex:String) -> UIColor {
  var hexString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
  
  if (hexString.hasPrefix("#")) {
    hexString.remove(at: hexString.startIndex)
  }
  
//  if ((hexString.count) != 6) {
//    return UIColor.gray
//  }
  
  var rgbValue:UInt64 = 0
  Scanner(string: hexString).scanHexInt64(&rgbValue)
  
  return UIColor(
    red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
    green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
    blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
    alpha: CGFloat(1.0)
  )
}
