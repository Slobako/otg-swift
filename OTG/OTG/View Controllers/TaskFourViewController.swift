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
    var jsonDict: [String: String] = [:]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // IBActions
    @IBAction func showMeTapped(_ sender: Any) {
        
        birthdayService.fetchJSON { (jsonDict) in
            self.jsonDict = jsonDict as! [String: String]
            self.outputLabel.text = "\(self.countBirthdaysPerMonthIn(dict: jsonDict as! [String : String]))"
        }
        
    }
    
    func countBirthdaysPerMonthIn(dict: [String: String]) -> [String: Int] {
        
        var arrayOfValues: [String] = []
        for key in dict.keys {
            let cutMonth = dict[key]?.prefix(2)
            arrayOfValues.append(String(describing: cutMonth))
        }
        
        var birthdayCount: [String: Int] = [:]
        
        arrayOfValues.forEach { birthdayCount[$0, default: 0] += 1 }
        print("birtday count \(birthdayCount)")
        return birthdayCount
    }
    
}
