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
            }
        }
    }
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
        for data in RecipeTestDataModel.allCases {
            let recipedata = SearchResults(id: data.id, title: data.description, image: data.recipeImage, readyInMinutes: data.time, aggregateLikes: data.likes, servings: data.servings, summary: data.summary)
            recipeSearch.append(recipedata)
        }
    }
    private func setupCollectionView() {
        RecipecollectionView.register(UINib(nibName: "RecipesCell", bundle: nil), forCellWithReuseIdentifier: recipesCellID)
        RecipecollectionView.dataSource = self
        RecipecollectionView.delegate = self
        addSubview(RecipecollectionView)
        RecipecollectionView.translatesAutoresizingMaskIntoConstraints = false
        RecipecollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        RecipecollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        RecipecollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        RecipecollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
}

// MARK: - UICollectionViewDelegate
extension RecipeFeedCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let recipeDetailController = RecipeController(nibName: "RecipeController", bundle: nil)
//                recipeDetailController.x = indexPath.row
        
//                navigationController?.pushViewController(recipeDetailController, animated: true)
        
    }
    
}

// MARK: - UICollectionViewDataSource
extension RecipeFeedCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipeSearch.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recipesCellID, for: indexPath) as! RecipesCell
        cell.likesLabel.text = String(recipeSearch[indexPath.row].aggregateLikes)
        cell.servingLabel.text = String(recipeSearch[indexPath.row].servings)
        cell.recipeImage.image = UIImage(named: recipeSearch[indexPath.row].image)
        cell.titleLabel.text = recipeSearch[indexPath.row].title
        cell.timeLabel.text = String(recipeSearch   [indexPath.row].readyInMinutes)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RecipeFeedCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: RecipecollectionView.bounds.size.width, height: RecipecollectionView.bounds.size.width/2.5)
        
    }
}
