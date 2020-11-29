//
//  RecentCell.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/26/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class RecentCell: RecipeFeedCell {
    
    override func loadTestData() {
        RecipeSearchAPI.manager.fetchRecipes(query: "chicken") { (recipes) in
                    self.recipeSearch = recipes.results
                } errorHandler: { (error) in
                    print(error)
                }
        }
    
}
