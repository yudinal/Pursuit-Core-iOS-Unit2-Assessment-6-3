//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//    MARK -- Outlet

    @IBOutlet weak var colorTableview: UITableView!
    
//    MARK -- Data Source
    
    var crayonColorInfo = Crayon.allTheCrayons
    

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    colorTableview.delegate = self
    colorTableview.dataSource = self
    
  }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayonColorInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crayonColor = crayonColorInfo[indexPath.row]
        let crayonCellInfo = tableView.dequeueReusableCell(withIdentifier: "crayonCell", for: indexPath)
        crayonCellInfo.textLabel?.text = crayonColor.name
        crayonCellInfo.detailTextLabel?.text = crayonColor.hex
//         crayonCellInfo.backgroundColor? =
        crayonCellInfo.backgroundColor = UIColor (red: CGFloat(crayonColor.red)/255, green: CGFloat(crayonColor.green)/255, blue: CGFloat(crayonColor.blue)/255, alpha: 1)
        
        return crayonCellInfo
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else {
            fatalError("Unexpected Error: No Identifier")
        }
        
        
        switch segueIdentifier {
        case "crayonDetailSegue":
            guard let crayonDetailsVC = segue.destination as? detailedColorViewController else{
                fatalError("Unexpected Error: No VC")
            }
            
            guard let selectedIndexPath = self.colorTableview.indexPathForSelectedRow else{
                fatalError("Unexpected Error: No Row Selected")
            }
            
            crayonDetailsVC.detailedCrayon = crayonColorInfo[selectedIndexPath.row]
            
        default:
            fatalError("Unexpected Identifier")
        }
    }


}

