//
//  CustomCollectionView.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/23/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class RecipeCollectionView: UIView {
    
    // MARK: - Propreties
    var recipesData = [SearchResults]() {
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
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .myBgColor
        return cv
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCollectionView()
    }
    // MARK: - Private
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
extension RecipeCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let recipeDetailController = RecipeController(nibName: "RecipeController", bundle: nil)
//                recipeDetailController.x = indexPath.row
        
//                navigationController?.pushViewController(recipeDetailController, animated: true)
        
        print(indexPath.row)
    }
    
}

// MARK: - UICollectionViewDataSource
extension RecipeCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recipesCellID, for: indexPath) as! RecipesCell
        cell.likesLabel.text = String(recipesData[indexPath.row].aggregateLikes)
        cell.servingLabel.text = String(recipesData[indexPath.row].servings)
        cell.recipeImage.image = UIImage(named: recipesData[indexPath.row].image)
        cell.titleLabel.text = recipesData[indexPath.row].title
        cell.timeLabel.text = String(recipesData[indexPath.row].readyInMinutes)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RecipeCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: RecipecollectionView.bounds.size.width, height: RecipecollectionView.bounds.size.width/2.5)
        
    }
}
