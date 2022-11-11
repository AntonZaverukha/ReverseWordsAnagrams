//
//  ViewController.swift
//  Reverse words
//
//  Created by Антон Заверуха on 24.05.2022.
//  Copyright © 2022 Антон Заверуха. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let reverse = Reverse()
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var reverseResultLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var reverseSegments: UISegmentedControl!
    @IBOutlet weak var defaultSegmentLabel: UILabel!
    @IBOutlet weak var customRulesTextField: UITextField!
    
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            defaultSegmentLabel.isHidden = false
            customRulesTextField.isHidden = true
        }
        else if sender.selectedSegmentIndex == 1 {
            defaultSegmentLabel.isHidden = true
            customRulesTextField.isHidden = false
        }
    }
    @IBAction func reverseButton(_ sender: Any) {
        if let label = reverseResultLabel.text, !label.isEmpty {
            textField.text = ""
            reverseResultLabel.text = ""
            customRulesTextField.text = ""
            reverseButton.alpha = 0.5
            reverseButton.setTitle("Reverse", for: .normal)
        }
        else if reverseSegments.selectedSegmentIndex == 0 {
            let inputString = self.textField.text!
            self.reverseResultLabel.text = reverse.reverseDefault(inputString)
            self.reverseButton.setTitle("Clear", for: .normal)
        }
        else if reverseSegments.selectedSegmentIndex == 1 {
            let inputString = self.textField.text!
            let rules = self.customRulesTextField.text!
            self.reverseResultLabel.text = reverse.reverseCustom(inputString, rules)
            self.reverseButton.setTitle("Clear", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.accessibilityIdentifier = "inputField"
        reverseResultLabel.accessibilityIdentifier = "resultLabel"
        reverseButton.accessibilityIdentifier = "reverseButton"
        infoLabel.accessibilityIdentifier = "infoLabel"
        customRulesTextField.accessibilityIdentifier = "rulesField"
        reverseSegments.accessibilityIdentifier = "reverseSegments"
        self.hideKeyboardWhenTappedAround()
        reverseButton.alpha = 0.5
        reverseButton.layer.cornerRadius = 14
        
        textField?.delegate = self
        reverseButton?.isUserInteractionEnabled = false
        customRulesTextField.isHidden = true
    }
}

extension ViewController {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if textField.isEditing{
            textField.isUserInteractionEnabled = true
        } else {
            textField.isUserInteractionEnabled = false
        }
        
        if !text.isEmpty{
            reverseButton?.isUserInteractionEnabled = true
            reverseButton.alpha = 1
        } else {
            reverseButton?.isUserInteractionEnabled = false
            reverseButton.alpha = 0.5
        }
        return true
    }
}

extension ViewController {
    
    func hideKeyboardWhenTappedAround() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

