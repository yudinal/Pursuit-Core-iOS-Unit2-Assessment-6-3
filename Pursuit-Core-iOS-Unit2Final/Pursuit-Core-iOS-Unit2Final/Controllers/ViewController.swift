//
//  ViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Alex Paul on 11/15/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import UIKit

class ColorTableController: UIViewController, UITableViewDataSource {
    var colors = Crayon.allTheCrayons
    @IBOutlet weak var colorTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = colorTableView.dequeueReusableCell(withIdentifier: "colorCell") as? CrayonCell {
            cell.crayonName.text = colors[indexPath.row].name
            cell.backgroundColor = UIColor(red: CGFloat(colors[indexPath.row].red / 255.0)
                , green: CGFloat(colors[indexPath.row].green / 255.0), blue: CGFloat(colors[indexPath.row].blue) / 255.0, alpha: CGFloat(0.5))

            cell.hexColor.text = colors[indexPath.row].hex

            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "crayonColor") as? ColorView {
            let color = colors[ indexPath.section]
           viewController.crayon = color
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @IBOutlet weak var crayonTableView: UITableView!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    colorTableView.dataSource = self
    // Do any additional setup after loading the view, typically from a nib.
  }


}
extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}

