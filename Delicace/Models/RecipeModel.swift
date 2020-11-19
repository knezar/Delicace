//
//  RecipeModel.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/18/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import Foundation


/*

 "results": [
         {
             "id": 661531,
             "title": "Steak with lemon and capers",
             "image": "https://spoonacular.com/recipeImages/661531-312x231.jpg",
             "imageType": "jpg"
         },
         {
             "id": 1096025,
             "title": "Steak Salad with Chimichurri Sauce",
             "image": "https://spoonacular.com/recipeImages/1096025-312x231.jpg",
             "imageType": "jpg"
         },
         {
             "id": 661522,
             "title": "Steak With Blue Cheese Sherry Sauce",
             "image": "https://spoonacular.com/recipeImages/661522-312x231.jpg",
             "imageType": "jpg"
         },
         {
             "id": 661510,
             "title": "Steak Salad With Roasted Potatoes and Fennel",
             "image": "https://spoonacular.com/recipeImages/661510-312x231.jpg",
             "imageType": "jpg"
         }
     ],
 
 */

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
