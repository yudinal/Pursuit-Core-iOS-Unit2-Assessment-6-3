//
//  CreateCrayonColorViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Anthony Gonzalez on 8/22/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateCrayonColorViewController: UIViewController {
    
    //MARK: -- Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    @IBOutlet weak var colorNamePreview: UILabel!
    @IBOutlet weak var hexPreviewLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hexTextField: UITextField!
    @IBOutlet weak var colorPreviewView: UIView!
    
    @IBOutlet weak var submitButton: UIButton!
    
    //MARK: -- IBActions
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: -- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates() 
        submitButton.layer.cornerRadius = submitButton.frame.height / 2
        submitButton.layer.borderColor = UIColor.black.cgColor
        submitButton.layer.borderWidth = 1.0
    }
    
    private func setDelegates () {
        nameTextField.delegate = self
        hexTextField.delegate = self
    }
}


//MARK: -- TextField Delegate Methods
extension CreateCrayonColorViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            colorNamePreview?.text = textField.text?.capitalized
            
        case 1:
            hexPreviewLabel?.text =  "#\(textField.text!)"
            colorPreviewView.backgroundColor = UIColor(hex: textField.text!)
            
        default:()
            
        }
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField.tag {
        case 0:
            if range.location == 0 && (string == " ") { return false }
            
        case 1:
            let aSet = NSCharacterSet(charactersIn:"abcdefABCDEF0123456789").inverted
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
