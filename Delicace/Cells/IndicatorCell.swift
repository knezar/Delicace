//
//  IndicatorCell.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/24/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class IndicatorCell: UICollectionViewCell {
    lazy var indicatorLabel: UILabel = {
        let lbl = UILabel()
        
        
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        indicatorLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        indicatorLabel.setCornerRadius(cornerR: (bounds.height-2)/2)
        addSubview(indicatorLabel)
        indicatorLabel.translatesAutoresizingMaskIntoConstraints = false
        indicatorLabel.topAnchor.constraint(equalTo: topAnchor, constant: 1).isActive = true
        indicatorLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1).isActive = true
        indicatorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1).isActive = true
        indicatorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1).isActive = true
        
    }
    override var isSelected: Bool {
        didSet {
            self.indicatorLabel.backgroundColor = isSelected ? UIColor.white.withAlphaComponent(0.7) : UIColor.black.withAlphaComponent(0.5)
        }
    }
}
