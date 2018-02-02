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
                    downloadImage(url: thumbnailUrl)
                    
                    // Using func from extension:
                    //thumbnailImageView.downloadedFrom(link: thumbnailUrlString)
                }
            }
        }
    }
    
    // Helper methods for image download
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.thumbnailImageView.image = UIImage(data: data)
            }
        }
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }

}
