//
//  TaskThreeViewController.swift
//  OTG
//
//  Created by Slobodan Kovrlija on 2/1/18.
//  Copyright © 2018 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class TaskThreeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var thumbnailCollectionView: UICollectionView!
    
    lazy var placeholderService: PlaceholderService = PlaceholderService()
    var arrayOfThumbnails = [Thumbnail?]()

    override func viewDidLoad() {
        super.viewDidLoad()

        thumbnailCollectionView.register(UINib(nibName: "ThumbnailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ThumbnailCell")
    }
    
    @IBAction func makeRequestTapped(_ sender: Any) {
        
        placeholderService.fetchThumbnails { [unowned self] (arrayOfThumbnails) in
            self.arrayOfThumbnails = arrayOfThumbnails
            DispatchQueue.main.async(execute: {
                self.thumbnailCollectionView.reloadData()
            })
        }
    }
    
    // MARK: - CollectionView delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfThumbnails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThumbnailCell", for: indexPath) as! ThumbnailCollectionViewCell
        
        cell.thumbnail = arrayOfThumbnails[indexPath.row]
        return cell
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
