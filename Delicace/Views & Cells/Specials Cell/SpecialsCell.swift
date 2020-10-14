//
//  CategoryCell.swift
//  Delicace
//
//  Created by C4Q on 5/1/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class SpecialsCell: UICollectionViewCell {
    
    let graphicHelper = GraphicHelper()
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
//        self.contentView.autoresizingMask = .flexibleHeight
//        self.contentView.autoresizingMask = .flexibleWidth
//        self.contentView.translatesAutoresizingMaskIntoConstraints = true
        
    }
    

}
