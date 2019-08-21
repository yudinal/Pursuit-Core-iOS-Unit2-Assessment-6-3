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
        self.view.backgroundColor == UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        return cell
    }
    
//    self.view.backgroundColor = UIColor.red
//
//
//
//@IBAction func colorChangeButtonPressed(_ sender: UIButton) {
//
//    self.view.backgroundColor = sender.currentTitleColor


    
    
    @IBOutlet weak var colorsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       colorsTableView.dataSource = self


        // Do any additional setup after loading the view.
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
