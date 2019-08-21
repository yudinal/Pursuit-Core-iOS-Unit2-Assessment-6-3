//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class MainColorViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var mainTableView: UITableView!
    var colorArray = newColorArray()
    var grabColor1 = grabColor()

   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newColorArray().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let newColorArray = colorArray[indexPath.row]
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "colors")
        
        cell?.textLabel?.text = newColorArray.name
        if cell?.textLabel?.text == edgeCaseColors()[0] {
            cell?.textLabel?.textColor = .white
            cell?.detailTextLabel?.textColor = .white
        }
        cell?.detailTextLabel?.text = newColorArray.hex
        cell?.backgroundColor = grabColor1[indexPath.row]
        return cell!
    }
    func edgeCaseColors() -> [String] {
        return ["Black"]
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "DetailedColorViewController") as? DetailColorViewController {
          
           
           viewController.passingInfo = colorArray[indexPath.row]
            viewController.changingColors = grabColor1[indexPath.row]

            navigationController?.pushViewController(viewController, animated: true)
        }
    }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  mainTableView.dataSource = self
    mainTableView.delegate = self
    }


}

