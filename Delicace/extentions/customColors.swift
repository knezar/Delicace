//
//  customColors.swift
//  Delicace
//
//  Created by C4Q on 4/26/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit
extension UIColor {
    static var myRed: UIColor {
        return UIColor.getRGB(red: 214, green: 108, blue: 135)
     }
    static var myPink: UIColor {
        return UIColor.getRGB(red: 254, green: 163, blue: 164)
     }
    static var myLightPink: UIColor {
        return UIColor.getRGB(red: 246, green: 234, blue: 237)
    }
    static func getRGB(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
