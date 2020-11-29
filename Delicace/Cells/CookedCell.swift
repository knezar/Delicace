//
//  CookedCell.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/28/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class CookedCell: RecipeFeedCell {
    
    
    override func loadTestData() {
        RecipeSearchAPI.manager.fetchRecipes(query: "soups") { (recipes) in
            self.recipeSearch = recipes.results
        } errorHandler: { (error) in
            print(error)
        }
    }
  
    
    
}
