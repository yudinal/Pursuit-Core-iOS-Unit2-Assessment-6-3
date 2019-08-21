//
//  ColorViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by EricM on 8/21/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController{
    
    @IBOutlet weak var selectedCrayon: UILabel!
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    @IBOutlet weak var alphaValue: UILabel!
    @IBOutlet weak var redSlide: UISlider!
    @IBOutlet weak var greenSlide: UISlider!
    @IBOutlet weak var blueSlide: UISlider!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var reset: UIButton!
    
    var newColor = ColorOption()
    var currentColor = UIColor()
    
    @IBAction func sliderValues(_ sender: UISlider) {
        switch  sender.tag {
        case 0:
            newColor.changeRed(red: CGFloat(sender.value))
            updateBackgroundColor()
            redValue.text? = "Red: \(redSlide.value)"
        case 1:
            newColor.changeGreen(green: CGFloat(sender.value))
            updateBackgroundColor()
            greenValue.text? = "Green: \(greenSlide.value)"
        case 2:
            newColor.changeBlue(blue: CGFloat(sender.value))
            updateBackgroundColor()
            blueValue.text? = "Blue: \(blueSlide.value)"
            
        default:
            print("Nice Try")
        }
        //redValue.val = Double((sender.value))
        //delegate?.textFont(fontSize: CGFloat(sender.value))
        //fontSize.text = "Font Size: \(sender.value)"
    }
    
    @IBAction func step(_ sender: UIStepper) {
        newColor.changeAlpha(alpha: CGFloat(sender.value))
        updateBackgroundColor()
        alphaValue.text? = "Alpha: \(alphaStepper.value)"
        //slide.value = Float(sender.value)
        //delegate?.textFont(fontSize: CGFloat(sender.value))
        //fontSize.text = "Font Size: \(sender.value)"
    }
    
    @IBAction func refresh(_ sender: UIButton) {
        self.view.backgroundColor = currentColor
    }

    func updateBackgroundColor() {
        self.view.backgroundColor = newColor.getColor()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = newColor.getColor()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
