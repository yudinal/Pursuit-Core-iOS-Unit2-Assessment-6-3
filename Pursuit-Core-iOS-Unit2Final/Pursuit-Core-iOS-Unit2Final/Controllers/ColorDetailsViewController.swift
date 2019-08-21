//
//  ColorDetailsViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Krystal Campbell on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorDetailsViewController: UIViewController {
    
      var colorSelectedDetail: Crayon!
    
    @IBOutlet weak var colorSelected: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorSelected.text = colorSelectedDetail.name
        
        view.backgroundColor = UIColor(displayP3Red: CGFloat(colorSelectedDetail.red/255), green: CGFloat(colorSelectedDetail.green/255), blue: CGFloat(colorSelectedDetail.blue/255), alpha: 1)
        

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
