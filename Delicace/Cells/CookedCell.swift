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
        guard let recipes = TestDataAPI.manager.readLocalFile(forName: "LambaData") else {return}
        
        
        recipeSearch = recipes
    }
  
    
    
}
