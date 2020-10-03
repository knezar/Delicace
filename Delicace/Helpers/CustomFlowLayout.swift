//
//  CustomFlowLayout.swift
//  Delicace
//
//  Created by C4Q on 5/3/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        if let collectionView = self.collectionView {
            return collectionView.frame.size != newBounds.size
        }

        return false
    }
}
