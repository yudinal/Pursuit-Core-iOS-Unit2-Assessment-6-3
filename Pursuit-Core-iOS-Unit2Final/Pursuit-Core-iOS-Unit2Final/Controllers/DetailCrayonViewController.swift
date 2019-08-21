//
//  DetailCrayonViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Jason Ruan on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailCrayonViewController: UIViewController {
    
    var crayon: Crayon!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red / 255), green: CGFloat(crayon.green / 255), blue: CGFloat(crayon.blue / 255), alpha: 1)
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
