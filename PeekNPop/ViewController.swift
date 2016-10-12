//
//  ViewController.swift
//  PeekNPop
//
//  Created by Siavash Abbasalipour on 12/10/16.
//  Copyright © 2016 sa. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController, UIViewControllerPreviewingDelegate  {

    // Properties
    private let reuseIdentifier = "photoCell"
    lazy var photos:[Photo] = {
        
        return [
            Photo(caption: "Lovely piece of art in Bordeaux", imageName: "bordeaux", city: "Bordeaux"),
            Photo(caption: "Cosy lake beach in France", imageName: "lake", city: "Bordeaux"),
            Photo(caption: "Harbour in France", imageName: "harbour", city: "Rouffiac"),
            Photo(caption: "Buda beach in Kortrijk", imageName: "buda", city: "Kortrijk")
        ]
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: view)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgPhotoDetail" {
            
            let photo = photos[(collectionView?.indexPathsForSelectedItems![0].row)!]
            
            let vc = segue.destination as! DetailViewController
            vc.photo = photo
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        
        // Configure the cell
        let photo = photos[indexPath.row]
        
        if let image = UIImage(named: photo.imageName) {
            
            cell.imageView.image = image
            
        }else {
            
            cell.imageView.image = UIImage(named: "image-not-found")
            
        }

        return cell
    }
    
    // MARK: UIViewControllerPreviewingDelegate methods
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {

        if let indexPath = collectionView?.indexPathForItem(at: view.convert(location, to: collectionView)), let cellAttributes = collectionView?.layoutAttributesForItem(at: indexPath) {
            //This will show the cell clearly and blur the rest of the screen for our peek.
            previewingContext.sourceRect = cellAttributes.frame
            guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return nil }
            
            let photo = photos[indexPath.row]
            detailVC.photo = photo
            guard let cell = collectionView?.cellForItem(at: indexPath) else { return nil }
            detailVC.preferredContentSize = CGSize(width: 0.0, height: 300)
            
            previewingContext.sourceRect = cell.frame
            return detailVC
        }
        return nil
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
        show(viewControllerToCommit, sender: self)
        
    }
}

