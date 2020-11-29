//
//  RecipeModel.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/18/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

//import Foundation
import UIKit

struct RecipeSearch: Codable {
    var results: [SearchResults]
}


struct SearchResults: Codable {
    var id: Int
    var title: String
    var image: String
    var readyInMinutes: Int
    var aggregateLikes: Int
    var servings: Int
    var summary: String
}

struct RecipeImage: Codable {
    var title: String
//    var image: UIImage
}
