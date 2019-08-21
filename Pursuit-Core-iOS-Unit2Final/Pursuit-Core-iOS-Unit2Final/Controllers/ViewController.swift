//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var colorsDisplayed = Crayon.allTheCrayons
    
    override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
  }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let detailViewController = segue.destination as? DetailViewController else {return}
        let colorDisplayed = colorsDisplayed[indexPath.row]
        detailViewController.colorSelected = colorDisplayed
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorsDisplayed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)
        let colorDisplayed = colorsDisplayed[indexPath.row]
        let redColor = (colorDisplayed.red)/255
        let greenColor = (colorDisplayed.green)/255
        let blueColor = (colorDisplayed.blue)/255
        cell.textLabel?.text = colorDisplayed.name
        cell.textLabel?.textColor = UIColor.white
        cell.detailTextLabel?.text = colorDisplayed.hex
        cell.detailTextLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(redColor), green: CGFloat(greenColor), blue: CGFloat(blueColor), alpha: 1.0)
        return cell
    }
    
    
}
