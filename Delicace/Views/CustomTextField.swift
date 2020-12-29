//
//  customTextField.swift
//  Delicace
//
//  Created by C4Q on 3/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
    
    required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    addBorderAndColor()
  }
    
    func addBorderAndColor() {
        let color = UIColor.getRGB(red: 254, green: 164, blue: 163)
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.myPink.cgColor
        self.layer.cornerRadius = 30
        self.clipsToBounds = true
    }
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
}
