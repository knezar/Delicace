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
        guard let recipes = TestDataAPI.manager.readLocalFile(forName: "ChickenData") else {return}
        
        
        recipeSearch = recipes
    }
    
}
