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
    
    // Properties
    lazy var imageService: ImageService = ImageService()
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    var thumbnail: Thumbnail? {
        didSet{
            if let thumbnailUrlString = thumbnail?.thumbnailUrl {
                    self.thumbnailImageView.contentMode = .scaleAspectFill
                imageService.downloadImageFrom(urlString: thumbnailUrlString, to: thumbnailImageView)
            }
        }
    }

}
