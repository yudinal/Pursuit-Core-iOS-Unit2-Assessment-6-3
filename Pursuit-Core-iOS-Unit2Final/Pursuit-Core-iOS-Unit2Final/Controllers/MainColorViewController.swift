//
//  MainColorViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Krystal Campbell on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class MainColorViewController: UIViewController, UITableViewDataSource {
    
     var crayons = Crayon.allTheCrayons
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: (indexPath))
        let color = crayons[indexPath.row]
        cell.textLabel?.text = color.name
        cell.detailTextLabel?.text = color.hex
        //cell.backgroundColor = UIColor(red: 239/255, green: 222/255, blue: 205/255, alpha: 1)
       //find a way to do it individually for each cell ...
       // cell.imageView = UIImage(cg)
        //cell.backgroundView = UIImage
        
       // cell.backgroundColor = UIColor(displayP3Red: self, green: self, blue: self, alpha: 1)
        //cell.backgroundView = UIView.init()
       // cell.backgroundColor = UIColor.init(displayP3Red: Double(value), green: Double(value), blue: Double(value), alpha: 1)
      //  cell.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
        
       // cell.imageView?.image = UIImage(named: String(crayons[indexPath.section][indexPath.row].))
        
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(color.red/255), green: CGFloat(color.green/255), blue: CGFloat(color.blue/255), alpha: 1)
    
        return cell
    }
    
    
    
    @IBOutlet weak var colorsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       colorsTableView.dataSource = self


        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = colorsTableView.indexPathForSelectedRow,
            let detailVC = segue.destination as? ColorDetailsViewController else {return}
        let colorToSendOverToDVC = crayons[indexPath.row]
        detailVC.colorSelectedDetail = colorToSendOverToDVC
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
