//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    

    @IBOutlet var crayonTableView: UITableView!
    var crayonValue = Crayon.allTheCrayons
  override func viewDidLoad() {
    super.viewDidLoad()
    crayonTableView.delegate = self
    crayonTableView.dataSource = self
  }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayonValue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = crayonTableView.dequeueReusableCell(withIdentifier: "colorCell")
        let info = crayonValue[indexPath.row]
        cell?.textLabel?.text = info.name
        cell?.detailTextLabel?.text = info.hex
        cell?.backgroundColor = UIColor(red: CGFloat(info.red/255.0), green: CGFloat(info.green/255.0), blue: CGFloat(info.blue/255.0), alpha: 1)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Color Box"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if let storyBoard = storyboard?.instantiateViewController(withIdentifier: "colorStoryBoard") as? ColorDetailViewController{
        
        let info = crayonValue[indexPath.row]
            storyBoard.detailColor = info
        
            self.navigationController?.pushViewController(storyBoard, animated: true)
    }
    }
}

