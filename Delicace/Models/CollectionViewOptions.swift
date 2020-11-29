//
//  CollectionViewOptions.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/27/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//
import UIKit


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
    
    var cellID: String {
        switch self {
        case .Popular: return "RecipeFeedCell"
        case .Trending: return "TrendingCell"
        case .Recent: return "RecentCell"
        }
    }
    
    var cell: UICollectionViewCell.Type {
        switch self {
        case .Popular: return RecipeFeedCell.self
        case .Trending: return TrendingCell.self
        case .Recent: return RecentCell.self
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
    
    var cellID: String {
        switch self {
        case .Favorites: return "FavoriteCell"
        case .Cooked: return "CookedCell"
        case .MyRecipes: return "RecentCell"
        }
    }
    
    var cell: UICollectionViewCell.Type {
        switch self {
        case .Favorites: return FavoritesCell.self
        case .Cooked: return CookedCell.self
        case .MyRecipes: return MyRecipeCell.self
        }
    }
}

enum CookBookOptions: Int, CaseIterable, CustomStringConvertible {
    case One
    
    var description: String { return "One"}
    var cellID: String {return "MyRecipes"}
    
    
}
