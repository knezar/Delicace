//
//  TrendingCell.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/26/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class TrendingCell: RecipeFeedCell {
    
    override func loadTestData() {
        guard let recipes = TestDataAPI.manager.readLocalFile(forName: "SeaFoodData") else {return}
        
        
        recipeSearch = recipes    }

}
