//
//  DetailViewController.swift
//  PeekNPop
//
//  Created by Siavash Abbasalipour on 12/10/16.
//  Copyright © 2016 sa. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // Properties
    var photo:Photo?
    
    // Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let photo = photo {
            
            imageView.image = UIImage(named: photo.imageName)
            captionLabel.text = photo.caption
            
            title = photo.city
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    override var previewActionItems: [UIPreviewActionItem] {
        get {
            let likeAction = UIPreviewAction(title: "Like", style: .default) { (action, viewController) -> Void in
                print("You liked the photo")
            }
            
            let deleteAction = UIPreviewAction(title: "Delete", style: .destructive) { (action, viewController) -> Void in
                print("You deleted the photo")
            }
            
            return [likeAction, deleteAction]
        }
    }
}
