//
//  TaskThreeViewController.swift
//  OTG
//
//  Created by Slobodan Kovrlija on 2/1/18.
//  Copyright © 2018 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class TaskThreeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // IBOutlets
    @IBOutlet weak var thumbnailCollectionView: UICollectionView!
    
    // Properties
    lazy var placeholderService: PlaceholderService = PlaceholderService()
    var arrayOfThumbnails = [Thumbnail?]()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        thumbnailCollectionView.register(UINib(nibName: "ThumbnailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ThumbnailCell")
    }
    
    // MARK: - IBActions
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let fullImageViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FullImage") as! FullImageViewController
        
        // Add navigation bar and done button to full image view
        let navigationController = UINavigationController(rootViewController: fullImageViewController)
        fullImageViewController.navigationItem.leftBarButtonItem = createBackButton()
        
        // Set url of image to bi displayed
        if let urlString = arrayOfThumbnails[indexPath.row]?.url {
            fullImageViewController.urlString = urlString
        }
        
        present(navigationController, animated: true, completion: nil)
    }
    
    // Creates back button for navigation bar on modally presented views
    func createBackButton() -> UIBarButtonItem {
        let backButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissModal))
        return backButton
    }
    
    @objc func dismissModal() {
        dismiss(animated: true, completion: nil)
    }

}
