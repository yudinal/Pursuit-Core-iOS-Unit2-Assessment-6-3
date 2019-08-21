//
//  MainViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Pursuit on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
     var allCrayons = Crayon.allTheCrayons
    
    
    @IBOutlet weak var displayColorView: UITableView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var hexLabel: UILabel!
    
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allCrayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "redCell", for: indexPath)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayColorView.delegate = self
        displayColorView.dataSource = self

    }
    

   
}
