//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var crayola = Crayon.allTheCrayons
    
    @IBOutlet weak var colorTableView: UITableView!
   
    override func viewDidLoad() {
    super.viewDidLoad()
        colorTableView.delegate = self
        colorTableView.dataSource = self
    
  }


}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Crayon.allTheCrayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crayola = Crayon.allTheCrayons
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        return cell
    }
    
    
}
