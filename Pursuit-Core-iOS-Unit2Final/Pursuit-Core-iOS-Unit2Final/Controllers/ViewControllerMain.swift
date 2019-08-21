//
//  ViewControllerMain.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by hildy abreu on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ViewControllerMain: UIViewController {
    var crayon = Crayon.allTheCrayons
    

    
    @IBOutlet weak var tableView: UITableView!
    
    

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
            tableView.delegate = self
            tableView.dataSource = self
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let detailVC = segue.destination as? DetailViewController else { return }
        let crayonsToSendOverToDVC = crayon[indexPath.row]
        detailVC.crayon = crayonsToSendOverToDVC

    
    
}


//func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    return 120



}

extension ViewControllerMain: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let eachCrayon = crayon[indexPath.row]
        //        let settingCells = crayon[indexPath.row]
        cell.textLabel?.text = eachCrayon.name
        cell.detailTextLabel?.text = eachCrayon.hex
        cell.backgroundColor = eachCrayon.displayColors()
        return cell
}

}
