//
//  MenuBarCollectionViewCell.swift
//  Delicace
//
//  Created by C4Q on 3/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class MenuBarCell: UICollectionViewCell {

    @IBOutlet weak var menuBarLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor(white: 1, alpha: 0.2)
        menuBarLabel.textColor = UIColor.white
    }
    
    override var isSelected: Bool {
        didSet {
                  self.backgroundColor = isSelected ? UIColor.getRGB(red: 128, green: 29, blue: 30) : UIColor(white: 1, alpha: 0.2)
              }
    }
}
