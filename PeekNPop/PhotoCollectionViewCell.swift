//
//  PhotoCollectionViewCell.swift
//  PeekNPop
//
//  Created by Siavash Abbasalipour on 12/10/16.
//  Copyright © 2016 sa. All rights reserved.
//

import Foundation
import UIKit

protocol PhotoCollectionVewCellDelegate: class {
    func onCommit(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController)
}
class PhotoCollectionViewCell: UICollectionViewCell {
    
    // IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    
}
