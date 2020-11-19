//
//  LeftChatCell.swift
//  Delicace
//
//  Created by Nezar Khabar on 10/13/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class LeftChatCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: "leftCell")
        
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
