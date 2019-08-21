//
//  ColorDetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Radharani Ribas-Valongo on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
      var color: Crayon!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet var background: UIView!
    
    
    
    func setUpView() {
        nameLabel.text = color.name
        background.backgroundColor = UIColor(red: CGFloat(color.red)/255, green: CGFloat(color.green)/255, blue: CGFloat(color.blue)/255, alpha: 1.0)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
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
