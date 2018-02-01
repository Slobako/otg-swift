//
//  TaskThreeViewController.swift
//  OTG
//
//  Created by Slobodan Kovrlija on 2/1/18.
//  Copyright © 2018 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class TaskThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func makeRequestTapped(_ sender: Any) {
        
        guard let url = NSURL(string: " https://jsonplaceholder.typicode.com/photos") else { return }
        //let task = URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            
        //}
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
