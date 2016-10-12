//
//  Photo.swift
//  PeekNPop
//
//  Created by Siavash Abbasalipour on 12/10/16.
//  Copyright © 2016 sa. All rights reserved.
//

import Foundation
import UIKit

struct Photo {
    
    let caption:String
    let imageName:String
    let city:String
    
    init( caption:String, imageName:String, city:String ){
        
        self.caption = caption
        self.imageName = imageName
        self.city = city
        
    }
    
}
