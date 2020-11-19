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
//        self.backgroundColor = .clear
        menuBarLabel.textColor = .myPink
//        menuBarLabel.font = .systemFont(ofSize: 13)
    }
    
    override var isSelected: Bool {
        didSet {
//            self.backgroundColor = isSelected ? .myLightPink : .myBgColor
            self.menuBarLabel.textColor = isSelected ? .myRed : .myPink
            self.menuBarLabel.font = isSelected ? .boldSystemFont(ofSize: 17) : .systemFont(ofSize: 15  )
        }
    }
}
