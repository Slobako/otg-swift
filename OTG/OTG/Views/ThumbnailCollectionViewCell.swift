//
//  ThumbnailCollectionViewCell.swift
//  OTG
//
//  Created by Slobodan Kovrlija on 2/1/18.
//  Copyright © 2018 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class ThumbnailCollectionViewCell: UICollectionViewCell {
    
    // IBOutlets
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    var thumbnail: Thumbnail? {
        didSet{
            if let thumbnailUrlString = thumbnail?.thumbnailUrl {
                if let thumbnailUrl = URL(string: thumbnailUrlString) {
                    self.thumbnailImageView.contentMode = .scaleAspectFill
                    
                    thumbnailImageView.downloadedFrom(link: thumbnailUrlString)
                }
            }
        }
    }

}
