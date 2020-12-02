//
//  CustomCollectionView.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/23/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class RecipeFeedCell: UICollectionViewCell {
    
    // MARK: - Propreties
    var recipeSearch = [SearchResults]() {
        didSet {
            DispatchQueue.main.async {
                self.RecipecollectionView.reloadData()
//                self.RecipecollectionView
            }
        }
    }
    //
    //    var recipeSearc = RecipeSearch {
    //        didSet {
    //            DispatchQueue.main.async {
    //                self.RecipecollectionView.reloadData()
    //            }
    //        }
    //    }()
    //    var image
    let recipesCellID = "recipesCell"
    
    lazy var RecipecollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .myBgColor
        return cv
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        loadTestData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCollectionView()
        loadTestData()
    }
    // MARK: - Private
    
    func loadTestData() {
        guard let recipes = TestDataAPI.manager.readLocalFile(forName: "SteakData") else {return}
        
        
        recipeSearch = recipes
        
        //        RecipeSearchAPI.manager.fetchRecipes(query: "fish") { (recipes) in
        //            self.recipeSearch = recipes.results
        //        } errorHandler: { (error) in
        //            print(error)
        //        }
    }
    //    private func loadPictures(url: String) -> UIImage {
    //        var image = UIImage()
    //        RecipeSearchAPI.manager.downloadPictures(urlString: url, completionHandler: { (avatarImage) in
    //            image = avatarImage
    //            print(image)
    //        }, errorHandler: {print($0)})
    //
    //        return image
    //    }
    
    private func setupCollectionView() {
        RecipecollectionView.register(UINib(nibName: "RecipesCell", bundle: nil), forCellWithReuseIdentifier: recipesCellID)
        RecipecollectionView.dataSource = self
        RecipecollectionView.delegate = self
        addSubview(RecipecollectionView)
        RecipecollectionView.fillSuperView()
    }
}

// MARK: - Collection Delegate
extension RecipeFeedCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let recipeDetailController = RecipeController(nibName: "RecipeController", bundle: nil)
        //                recipeDetailController.x = indexPath.row
        
        //                navigationController?.pushViewController(recipeDetailController, animated: true)
        
    }
    
}

// MARK: - Collection DataSource
extension RecipeFeedCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeSearch.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recipesCellID, for: indexPath) as! RecipesCell
        cell.likesLabel.text = String(recipeSearch[indexPath.row].aggregateLikes)
        cell.servingLabel.text = String(recipeSearch[indexPath.row].servings)
        
        
        let string = recipeSearch[indexPath.row].image
        cell.recipeImage.image = NSCacheHelper.manager.getImage(with: string)
        //        let indexPath = IndexPath(item: indexPath.row, section: 0)
        //        collectionView.reloadItems(at: [indexPath])
        
        
        
        cell.titleLabel.text = recipeSearch[indexPath.row].title
        cell.timeLabel.text = String(recipeSearch[indexPath.row].readyInMinutes)
        let summaryString = recipeSearch[indexPath.row].summary
        let summary = summaryString.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        
        cell.summaryLabel.text = summary
        return cell
    }
}

// MARK: - DelegateFlowLayout
extension RecipeFeedCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: RecipecollectionView.bounds.size.width, height: RecipecollectionView.bounds.size.width/2.5)
        
    }
}
