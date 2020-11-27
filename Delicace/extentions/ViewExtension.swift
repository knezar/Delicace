//
//  extentions.swift
//  Delicace
//
//  Created by C4Q on 3/19/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

extension UIView {
    func setCornerRadius(cornerR: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = cornerR
    }
}

