//
//  DetailController.swift
//  Delicace
//
//  Created by C4Q on 3/31/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class RecipeController: UIViewController {
    
    // MARK: - Properties
    var customData = [SearchResults]() 

    // MARK: - Outlets
    @IBOutlet weak var collectionViewTest: RecipeCollectionView!

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTestData()
    }
    
    // MARK: - Private
    func loadTestData() {
        for data in RecipeTestDataModel.allCases {
            let recipedata = SearchResults(id: data.id, title: data.description, image: data.recipeImage, readyInMinutes: data.time, aggregateLikes: data.likes, servings: data.servings, summary: data.summary)
            customData.append(recipedata)
        }
//        collectionViewTest.recipesData = customData
        
    }

    // MARK: - Actions
    


}
