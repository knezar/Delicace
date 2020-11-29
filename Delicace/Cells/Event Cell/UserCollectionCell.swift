//
//  UserCollectionCellCollectionViewCell.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/20/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class UserCollectionCell: UICollectionViewCell {
    
    
    //MARK: - Propreties
     lazy var userImage: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    lazy var textLabel: UILabel = {
       let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 18)
        lbl.textColor = UIColor.white
        lbl.textAlignment = .center
        return lbl
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureUI()
    }
    
    override func layoutSublayers(of layer: CALayer) {
          super.layoutSublayers(of: self.layer)
        layer.cornerRadius = contentView.bounds.height/2
        clipsToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.myRed.cgColor
        
        
    }
    
    //MARK: - Private
    
    func configureUI() {
        contentView.addSubview(textLabel)
        textLabel.fillSuperView()
        
        contentView.addSubview(userImage)
        userImage.fillSuperView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
