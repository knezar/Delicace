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
    
    func fillSuperView() {
        guard let superView = superview else {return}
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
    }
    
    func fillSafeArea() {
        guard let superView = superview else {return}
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}

