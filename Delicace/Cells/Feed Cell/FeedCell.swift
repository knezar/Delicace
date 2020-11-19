//
//  FeedCell.swift
//  Delicace
//
//  Created by C4Q on 3/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    let graphicHelper = GraphicHelper()
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()

        
    }
    

}
