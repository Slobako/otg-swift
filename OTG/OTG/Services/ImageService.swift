//
//  ImageService.swift
//  OTG
//
//  Created by Slobodan Kovrlija on 2/2/18.
//  Copyright © 2018 Slobodan Kovrlija. All rights reserved.
//

import Foundation
import UIKit

struct ImageService {
    
    // Since NSCache has a KeyType : AnyObject constraint, I couldn't
    // use value type (in this case, image's Id which is Int), so I
    // will use image's url string as its key (must be NSString though)
    var imageCache = NSCache<NSString, UIImage>()
    
    func downloadImageFrom(urlString: String, to imageView: UIImageView) {
        // Check if the image has been cached
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            imageView.image = cachedImage
        } else { // If it hasn't, download it
            guard let url = URL(string: urlString) else { return }
            let task = URLSession.shared.dataTask(with: url) { data, urlResponse, error in
                guard
                    let httpURLResponse = urlResponse as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = urlResponse?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else { return }
                DispatchQueue.main.async() {
                    imageView.image = image
                }
                // Cache the downloaded image
                self.imageCache.setObject(image, forKey: urlString as NSString)
                print("cached image: \(String(describing: self.imageCache.object(forKey: urlString as NSString)))")
            }
            task.resume()
        }
    }
}
