//
//  ProfileMenuOptions.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/22/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

enum ProfileMenuOptions: Int, CaseIterable, CustomStringConvertible {
    
    case Favorites
    case TryOut
    case RecipeBook
    
    var description: String {
        switch self {
        case .Favorites: return "Favorites"
        case .TryOut: return "Cooked"
        case .RecipeBook: return "My Recipes"
        }
    }
}

enum HomeMenuOptions: Int, CaseIterable, CustomStringConvertible {
    
    case Popular
    case Trending
    case Recent
    
    var description: String {
        switch self {
        case .Popular: return "Popular"
        case .Trending: return "Trending"
        case .Recent: return "Recent"
        }
    }
}
