//
//  ChatTableCell.swift
//  Delicace
//
//  Created by Nezar Khabar on 10/13/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class ChatTableCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var msgSinppet: UILabel!
    
    
    
    // MARK: - Propreties
    
    
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        backgroundColor = .myBgColor
        configureCell()
    }

    override func layoutSublayers(of layer: CALayer) {
          super.layoutSublayers(of: self.layer)
        userImage.layer.cornerRadius = contentView.bounds.height * 0.75/2
        userImage.clipsToBounds = true
        
    }
    // MARK: - Private
    func configureCell() {
        date.textColor = .myPink
        userName.textColor = .myRed
        msgSinppet.textColor = .myPink

    }
    
    
    
    
    
    // MARK:- Actions
    
    
}
