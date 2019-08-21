//
//  CrayonsViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Mariel Hoepelman on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//
import Foundation
import UIKit

class CrayonsViewController: UIViewController {
    
    var crayons = Crayon.allTheCrayons
    
    @IBOutlet weak var CrayonsTableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CrayonsTableVIew.delegate = self
        CrayonsTableVIew.dataSource = self
    }
}

extension CrayonsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crayons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension CrayonsViewController: UITableViewDelegate {
    
}


