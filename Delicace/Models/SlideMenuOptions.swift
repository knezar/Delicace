//
//  SlideMenuOptions.swift
//  Delicace
//
//  Created by C4Q on 5/3/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

enum SlideMenuOptions: Int, CustomStringConvertible {
    
    case Recipes
    case Feed
    case Chat
    case Favorite
    case Profile
    case Settings
    case Logout
    
    var description: String {
        switch self {
            case .Recipes: return "Recipes"
            case .Feed: return "Feed"
            case .Chat: return "Chat"
            case .Favorite: return  "Favorite"
            case .Profile: return  "Profile"
            case .Settings: return  "Settings"
            case .Logout: return  "Logout"
        }
    }
    
    var lightImage: UIImage {
        switch self {
        case .Recipes: return UIImage(named: "Recipes") ?? UIImage()
        case .Feed: return UIImage(named: "Feed") ?? UIImage()
        case .Chat: return UIImage(named: "Chat") ?? UIImage()
        case .Favorite: return  UIImage(named: "Favorite") ?? UIImage()
        case .Profile: return  UIImage(named: "Profile") ?? UIImage()
        case .Settings: return  UIImage(named: "Settings") ?? UIImage()
        case .Logout: return  UIImage(named: "Logout") ?? UIImage()
        }
    }
    
    var darkImage: UIImage {
        switch self {
        case .Recipes: return UIImage(named: "Recipes-h") ?? UIImage()
        case .Feed: return UIImage(named: "Feed-h") ?? UIImage()
        case .Chat: return UIImage(named: "Chat-h") ?? UIImage()
        case .Favorite: return  UIImage(named: "Favorite-h") ?? UIImage()
        case .Profile: return  UIImage(named: "Profile-h") ?? UIImage()
        case .Settings: return  UIImage(named: "Settings-h") ?? UIImage()
        case .Logout: return  UIImage(named: "Logout-h") ?? UIImage()
        }
    }

}
