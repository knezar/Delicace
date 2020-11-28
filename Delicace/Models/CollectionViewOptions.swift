//
//  CollectionViewOptions.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/27/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

enum CollectionOptions: Int, CaseIterable, CustomStringConvertible {
    case Main
    case Profile
    case CookBook
    
    var description: String {
        switch self {
        case .Main: return "Main"
        case .Profile: return "Profile"
        case .CookBook: return "Cook Book"
        }
    }
}

enum MainOptions: Int, CaseIterable, CustomStringConvertible {
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

enum ProfileOptions: Int, CaseIterable, CustomStringConvertible {
    case Favorites
    case Cooked
    case MyRecipes
    
    var description: String {
        switch self {
        case .Favorites: return "Favorites"
        case .Cooked: return "Cooked"
        case .MyRecipes: return "My Recipes"
        }
    }
}

enum CookBookOptions: Int, CaseIterable, CustomStringConvertible {
    case One
    
    var description: String {
        switch self {
        case .One: return "One"
        }
    }
}
