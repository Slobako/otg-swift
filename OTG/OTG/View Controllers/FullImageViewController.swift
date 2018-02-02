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
    lazy var imageService: ImageService = ImageService()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        if let urlString = urlString {
            imageService.downloadImageFrom(urlString: urlString, to: fullImageView)
        }
        
    }

}
