//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableCellOut: UITableView!
    var crayonTable = Crayon.allTheCrayons
    override func viewDidLoad() {
        super.viewDidLoad()
        tableCellOut.delegate = self
        tableCellOut.dataSource = self
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayonTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableCellOut.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        let selected = crayonTable[indexPath.row]
        cell.textLabel?.text = selected.name
        cell.detailTextLabel?.text =  selected.hex
        cell.backgroundColor = UIColor.init(displayP3Red: CGFloat(selected.red/255), green: CGFloat(selected.green/255),
            blue: CGFloat(selected.blue/255),
            alpha: CGFloat(1.0))
        return cell
    }
}

