//
//  TaskOneViewController.swift
//  OTG
//
//  Created by Slobodan Kovrlija on 2/1/18.
//  Copyright © 2018 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class TaskOneViewController: UIViewController, UITextFieldDelegate {
    
    // IBOutlets:
    @IBOutlet weak var integerTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        integerTextField.delegate = self
        addDoneButtonOnKeyboard()
    }

    // MARK: - Text Field Delegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let numberString = integerTextField.text {
            let enteredNumber = Int(numberString)
            if let enteredNumber = enteredNumber {
                let numberOfOnes = countOnesIn(n: enteredNumber)
                resultLabel.text = "There are: \(numberOfOnes)  1s."
            }
        }
    }
    
    // Adds done button on number pad keyboard
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                        target: nil,
                                        action: nil)
    
        let doneButton: UIBarButtonItem = UIBarButtonItem(title: "Done",
                                                          style: .done,
                                                          target: self,
                                                          action: #selector(doneButtonAction))
        
        let items = NSMutableArray()
        items.add(flexSpace)
        items.add(doneButton)
        
        doneToolbar.items = items as? [UIBarButtonItem]
        doneToolbar.sizeToFit()
        
        integerTextField.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        integerTextField.resignFirstResponder()
    }

    // Returns the number of 1-s in binary representation of n
    func countOnesIn(n: Int) -> Int {
        
        var a = n
        var ones = 0
        
        while a > 0 {
            a &= (a-1)
            ones += 1
        }
        return ones
    }

}
