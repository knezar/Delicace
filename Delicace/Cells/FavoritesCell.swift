//
//  FavoritesCell.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/28/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class FavoritesCell: RecipeFeedCell {
    
    
    override func loadTestData() {
        guard let recipes = TestDataAPI.manager.readLocalFile(forName: "SoupData") else {return}
        
        
        recipeSearch = recipes
    }
    
}
