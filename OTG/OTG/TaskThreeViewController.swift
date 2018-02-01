//
//  TaskThreeViewController.swift
//  OTG
//
//  Created by Slobodan Kovrlija on 2/1/18.
//  Copyright © 2018 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class TaskThreeViewController: UIViewController {
    
    lazy var placeholderService: PlaceholderService = PlaceholderService()
    var arrayOfThumbnails = [Thumbnail?]()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func makeRequestTapped(_ sender: Any) {
        
        placeholderService.fetchThumbnails { [unowned self] (arrayOfThumbnails) in
            print("array of thumbnailz iz: \(arrayOfThumbnails)")
        }
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
