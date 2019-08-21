//
//  ColorDetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Mr Wonderful on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    var redDelegate: PassRedValue?
    var greenDelegate: PassGreenValue?
    var blueDelegate: PassBlueValue?
    
    var newRedValue:CGFloat!
    var newGreenValue:CGFloat!
    var newBlueValue:CGFloat!
    var detailColor:Crayon!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    @IBOutlet var colorName: UILabel!
    
    
    func populateView(){
        colorName.text = detailColor.name
        view.backgroundColor = UIColor(red: CGFloat(detailColor.red/255.0), green: CGFloat(detailColor.green/255.0), blue: CGFloat(detailColor.blue/255.0), alpha: 1)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       populateView()
    }
    
   
    @IBAction func redSliderAction(_ sender: UISlider) {
        newRedValue = CGFloat(sender.value)
        redDelegate?.passRedValue(num: newRedValue)
        
    }
    
    @IBAction func greenSliderAction(_ sender: UISlider) {
        newGreenValue = CGFloat(sender.value)
        greenDelegate?.passGreenValue(num: newGreenValue)
    }
    
    @IBAction func blueSliderAction(_ sender: UISlider) {
        newBlueValue = CGFloat(sender.value)
        blueDelegate?.passBlueValue(num: newBlueValue)
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
