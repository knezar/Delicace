//
//MenuOptions.swift
//  Delicace
//
//  Created by C4Q on 5/3/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

enum MenuOptions: Int, CustomStringConvertible, CaseIterable {
    
    case Home
    case Chat
    case MyRecipes
    case Calendar
    case Profile
    case Settings
    case Logout
    
    var description: String {
        switch self {
        case .Home: return "Home"
        case .Chat: return "Chat"
        case .MyRecipes: return "My Recipes"
        case .Calendar: return  "Calendar"
        case .Profile: return  "Profile"
        case .Settings: return  "Settings"
        case .Logout: return  "Logout"
        }
    }
    
    var lightColor: UIColor {
        switch self {
        case .Home: return UIColor.myPink
        case .Chat: return UIColor.myPink
        case .MyRecipes: return UIColor.myPink
        case .Calendar: return UIColor.myPink
        case .Profile: return UIColor.myPink
        case .Settings: return UIColor.myPink
        case .Logout: return UIColor.myPink
        }
    }
    
    var darkColor: UIColor {
        switch self {
        case .Home: return UIColor.myRed
        case .Chat: return UIColor.myRed
        case .MyRecipes: return UIColor.myRed
        case .Calendar: return UIColor.myRed
        case .Profile: return UIColor.myRed
        case .Settings: return UIColor.myRed
        case .Logout: return UIColor.myRed
        }
    }
    
    var lightFont: UIFont {
        switch self {
        case .Home: return UIFont.boldSystemFont(ofSize: 16)
        case .Chat: return UIFont.boldSystemFont(ofSize: 16)
        case .MyRecipes: return UIFont.boldSystemFont(ofSize: 16)
        case .Calendar: return UIFont.boldSystemFont(ofSize: 16)
        case .Profile: return UIFont.boldSystemFont(ofSize: 16)
        case .Settings: return UIFont.boldSystemFont(ofSize: 16)
        case .Logout: return UIFont.boldSystemFont(ofSize: 16)
        }
    }
    var darkFont: UIFont {
        switch self {
        case .Home: return UIFont.boldSystemFont(ofSize: 20)
        case .Chat: return UIFont.boldSystemFont(ofSize: 20)
        case .MyRecipes: return UIFont.boldSystemFont(ofSize: 20)
        case .Calendar: return UIFont.boldSystemFont(ofSize: 20)
        case .Profile: return UIFont.boldSystemFont(ofSize: 20)
        case .Settings: return UIFont.boldSystemFont(ofSize: 20)
        case .Logout: return UIFont.boldSystemFont(ofSize: 20)
        }
    }
    
    var lightImage: UIImage {
        switch self {
        case .Home: return UIImage(named: "Feed") ?? UIImage()
        case .Chat: return UIImage(named: "Chat") ?? UIImage()
        case .MyRecipes: return UIImage(named: "Recipes") ?? UIImage()
        case .Calendar: return  UIImage(named: "Calendar") ?? UIImage()
        case .Profile: return  UIImage(named: "Profile") ?? UIImage()
        case .Settings: return  UIImage(named: "Settings") ?? UIImage()
        case .Logout: return  UIImage(named: "Logout") ?? UIImage()
        }
    }
    
    var darkImage: UIImage {
        switch self {
        case .Home: return UIImage(named: "Feed-h") ?? UIImage()
        case .Chat: return UIImage(named: "Chat-h") ?? UIImage()
        case .MyRecipes: return UIImage(named: "Recipes-h") ?? UIImage()
        case .Calendar: return  UIImage(named: "Calendar-h") ?? UIImage()
        case .Profile: return  UIImage(named: "Profile-h") ?? UIImage()
        case .Settings: return  UIImage(named: "Settings-h") ?? UIImage()
        case .Logout: return  UIImage(named: "Logout-h") ?? UIImage()
        }
    }
    
}
