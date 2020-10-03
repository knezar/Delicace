//
//  RecipeCell.swift
//  Delicace
//
//  Created by C4Q on 5/1/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    
    let graphicHelper = GraphicHelper()
    let gradientLayer = CAGradientLayer()
 
    
    
    @IBOutlet weak var shadedView: UIView!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func layoutSublayers(of layer: CALayer) {
          super.layoutSublayers(of: self.layer)
          gradientLayer.frame = shadedView.bounds
            let colorSet = [UIColor.white, UIColor.clear]
        let location = [0, 1.0]
            shadedView.addGradient(with: gradientLayer, colorSet: colorSet, locations: location)
      }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.contentView.autoresizingMask = .flexibleHeight
//        self.contentView.autoresizingMask = .flexibleWidth
//        self.contentView.translatesAutoresizingMaskIntoConstraints = true
    }
}


extension UIView {
    func addGradient(with layer: CAGradientLayer, gradientFrame: CGRect? = nil, colorSet: [UIColor],
                     locations: [Double], startEndPoints: (CGPoint, CGPoint)? = nil) {
        layer.frame = gradientFrame ?? self.bounds
        layer.frame.origin = .zero

        let layerColorSet = colorSet.map { $0.cgColor }
        let layerLocations = locations.map { $0 as NSNumber }

        layer.colors = layerColorSet
        layer.locations = layerLocations

        if let startEndPoints = startEndPoints {
            layer.startPoint = startEndPoints.0
            layer.endPoint = startEndPoints.1
        }

        self.layer.insertSublayer(layer, above: self.layer)
    }
}
