//
//  CreateCrayonColorViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Anthony Gonzalez on 8/22/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateCrayonColorViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    
    @IBOutlet weak var colorNamePreview: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hexTextField: UITextField!
    @IBOutlet weak var colorPreviewView: UIView!
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        hexTextField.delegate = self
    }
}

extension CreateCrayonColorViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0: colorNamePreview?.text = textField.text
        case 1:
            colorPreviewView.backgroundColor = UIColor(hex: hexTextField.text!)
        default:()
        }
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField.tag {
        case 0: ()
        case 1: let aSet = NSCharacterSet(charactersIn:"abcdefABCDEF0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        
        if string == numberFiltered {
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            return updatedText.count <= 6
        } else {
            return false
            }
        default: ()
        }
        return true
    }
}
