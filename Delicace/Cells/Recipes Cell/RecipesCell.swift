//
//  RecipesCell.swift
//  Delicace
//
//  Created by C4Q on 5/1/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class RecipesCell: UICollectionViewCell {
    
    
    // MARK: - Propreties
    let graphicHelper = GraphicHelper()
    let gradientLayer = CAGradientLayer()
    
    
    // MARK: - Outlets
    //    @IBOutlet weak var shadedView: UIView!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var servingLabel: UILabel!
    
    
    // MARK: - init
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    // MARK: - Private
   private func configureUI() {
        backgroundColor = .white
        recipeImage.layer.borderWidth = 1
        recipeImage.layer.borderColor = UIColor.myPink.cgColor
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.myLightPink.cgColor
        clipsToBounds = true
    }
}
