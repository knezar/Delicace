//
//  NSCacheHelper.swift
//  Delicace
//
//  Created by C4Q on 4/30/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class NSCacheHelper {
    private init() {}
    static let manager = NSCacheHelper()
    private var myCache = NSCache<NSString, UIImage>()
    func addImage(with imageID: String, and image: UIImage) {
        myCache.setObject(image, forKey: imageID as NSString)
    }
    func getImage(with imageID: String) -> UIImage? {
        return myCache.object(forKey: imageID as NSString)
    }
}
