//
//  TaskFourViewController.swift
//  OTG
//
//  Created by Slobodan Kovrlija on 2/1/18.
//  Copyright © 2018 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class TaskFourViewController: UIViewController {

    // IBOutlets
    @IBOutlet weak var outputLabel: UILabel!
    
    // Properties
    lazy var birthdayService: BirthdayService = BirthdayService()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // IBActions
    @IBAction func showMeTapped(_ sender: Any) {
        
        birthdayService.fetchJSON { (jsonDict) in
            let arrayOfMonthsAndBirthdays = self.countBirthdaysPerMonthIn(dict: jsonDict as! [String: String])
            var labelText = ""
            // To print without the square brackets for dictionaries
            for dict in arrayOfMonthsAndBirthdays {
                let dictText = "\(dict.keys.first!): \(dict.values.first!)\n"
                labelText.append(dictText)
            }
            self.outputLabel.text = labelText
        }
    }
    
    func countBirthdaysPerMonthIn(dict: [String: String]) -> [[String: Int]] {
        
        var arrayOfValues: [String] = []
        for key in dict.keys {
            let cutMonth = dict[key]?.prefix(2)
            arrayOfValues.append(String(describing: cutMonth!))
        }
        
//        var birthdayCount: [String: Int] = [:]
//        arrayOfValues.forEach { birthdayCount[$0, default: 0] += 1 }
        
        // option with reduce((into: [:])
        let birthdayCount = arrayOfValues.reduce(into: [:]) { (birthdayCount, month) in
            birthdayCount[month, default: 0] += 1
        }
        
        print("birtday count: \(birthdayCount)")
        
        let arrayOfMonthsAndBirthdays = convertMonthNumberIntoName(dict: birthdayCount)
        return arrayOfMonthsAndBirthdays
    }
    
    // Creates an array of month and birthday number pairs
    func convertMonthNumberIntoName(dict: [String: Int]) -> [[String: Int]] {
        var arrayOfMonthsAndBirthdays: [[String: Int]] = []
        for key in dict.keys.sorted() {
            switch key {
            case "01": arrayOfMonthsAndBirthdays.append(["January": dict[key]!])
            case "02": arrayOfMonthsAndBirthdays.append(["February": dict[key]!])
            case "03": arrayOfMonthsAndBirthdays.append(["March": dict[key]!])
            case "04": arrayOfMonthsAndBirthdays.append(["April": dict[key]!])
            case "05": arrayOfMonthsAndBirthdays.append(["May": dict[key]!])
            case "06": arrayOfMonthsAndBirthdays.append(["June": dict[key]!])
            case "07": arrayOfMonthsAndBirthdays.append(["July": dict[key]!])
            case "08": arrayOfMonthsAndBirthdays.append(["August": dict[key]!])
            case "09": arrayOfMonthsAndBirthdays.append(["September": dict[key]!])
            case "10": arrayOfMonthsAndBirthdays.append(["October": dict[key]!])
            case "11": arrayOfMonthsAndBirthdays.append(["November": dict[key]!])
            case "12": arrayOfMonthsAndBirthdays.append(["December": dict[key]!])
            default: break
            }
        }
        return arrayOfMonthsAndBirthdays
    }
    
}
