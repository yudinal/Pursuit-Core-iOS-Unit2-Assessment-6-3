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
        colorPreviewView.backgroundColor = UIColor(hex: hexTextField.text!)
        return true
    }
}
