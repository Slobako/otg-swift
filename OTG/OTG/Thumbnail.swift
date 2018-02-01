//
//  Thumbnail.swift
//  OTG
//
//  Created by Slobodan Kovrlija on 2/1/18.
//  Copyright © 2018 Slobodan Kovrlija. All rights reserved.
//

import Foundation

struct Thumbnail {
    let albumId: Int?
    let id: Int?
    let title: String?
    let url: String?
    let thumbnailUrl: String?
    
    init?(json: [String: Any]) {
        guard let albumId = json["albumId"] as? Int,
              let id = json["id"] as? Int,
              let title = json["title"] as? String,
              let url = json["url"] as? String,
              let thumbnailUrl = json["thumbnailUrl"] as? String
              else { return nil }
        
        self.albumId = albumId
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
}


