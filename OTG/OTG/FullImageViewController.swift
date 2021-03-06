//
//  FullImageViewController.swift
//  OTG
//
//  Created by Slobodan Kovrlija on 2/1/18.
//  Copyright © 2018 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class FullImageViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var fullImageView: UIImageView!
    
    // Properties
    var urlString: String?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        if let urlString = urlString {
            fullImageView.downloadedFrom(link: urlString)
        }
        
    }

}
