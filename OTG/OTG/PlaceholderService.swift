//
//  PlaceholderService.swift
//  OTG
//
//  Created by Slobodan Kovrlija on 2/1/18.
//  Copyright © 2018 Slobodan Kovrlija. All rights reserved.
//

import Foundation
import UIKit

struct PlaceholderService {
    
    func fetchThumbnails(completion: @escaping([Thumbnail]) -> Void) {
        
        let urlString = "https://jsonplaceholder.typicode.com/photos"
        guard let url = URL.init(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            
            if urlResponse != nil {
                
                do {
                    guard let data = data else { return }
                    var arrayOfThumbnails = [Thumbnail]()
                    if let responseObject = try JSONSerialization.jsonObject(with: data) as? [[String: Any]] {
                        
                        for object in responseObject {
                            if let thumbnail = Thumbnail(json: object) {
                                arrayOfThumbnails.append(thumbnail)
                            }
                        }
                        completion(arrayOfThumbnails)
                    }
                    
                } catch let error {
                    print("Error occured: \(error)")
                }
                
            } else {
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
}
