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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let numberString = integerTextField.text {
            let enteredNumber = Int(numberString)
            if let enteredNumber = enteredNumber {
                let numberOfOnes = countOnesIn(n: enteredNumber)
                resultLabel.text = "There are: \(numberOfOnes) 1s"
            }
        }
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
