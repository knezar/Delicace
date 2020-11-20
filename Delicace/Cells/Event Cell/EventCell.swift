//
//  EventCell.swift
//  Delicace
//
//  Created by Nezar Khabar on 10/31/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class EventCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.myLightPink.cgColor
        clipsToBounds = true
    }

}
