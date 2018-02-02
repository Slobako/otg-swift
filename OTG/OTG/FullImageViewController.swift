//
//  FullImageViewController.swift
//  OTG
//
//  Created by Slobodan Kovrlija on 2/1/18.
//  Copyright © 2018 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class FullImageViewController: UIViewController {
    
    @IBOutlet weak var fullImageView: UIImageView!
    
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let urlString = urlString {
            fullImageView.downloadedFrom(link: urlString)
        }
        
    }

}
