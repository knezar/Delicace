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
    
    var customCellID: String
    var customNibName: String
    var customData: [String]
    var customCell: RecipesCell
    
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .myBgColor
        return cv
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCollectionView()
        //        setupWhiteBarEffect()
    }
    init(customCellID: String, customNibName: String, customData: [String]) {
        self.customCellID = customCellID
        self.customNibName = customNibName
        self.customData = customData
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        setupCollectionView()
    }
    
    //    override init(frame: CGRect) {
    //        super.init(frame: frame)
    //        setupCollectionView()
    ////        setupWhiteBarEffect()
    //    }
    
    
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: customNibName, bundle: nil), forCellWithReuseIdentifier: customCellID)
        collectionView.dataSource = self
        collectionView.delegate = self
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        let selectedItem = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedItem, animated: false, scrollPosition: UICollectionView.ScrollPosition())
    }
}

// MARK: - UICollectionViewDelegate
extension CustomCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let recipeDetailController = RecipeController(nibName: "RecipeController", bundle: nil)
        recipeDetailController.x = indexPath.row
        
        navigationController?.pushViewController(recipeDetailController, animated: true)
        
        print(indexPath.row)
    }
    
}

// MARK: - UICollectionViewDataSource
extension CustomCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        
        return customData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = recipesCV.dequeueReusableCell(withReuseIdentifier: recipesCellID, for: indexPath) as!
            
            return testData(cell: cell, indexPath: indexPath)
//           return configureCell(cell: cell, indexPath: indexPath)
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: specialsCellID, for: indexPath) as! SpecialsCell
            
            return testDataSpecials(cell: cell, indexPath: indexPath)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CustomCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == recipesCV {
            return CGSize(width: recipesCV.bounds.size.width, height: recipesCV.bounds.size.width/2.5)
        } else {
            return CGSize(width: specialsCV.bounds.width, height: specialsCV.bounds.size.height)
        }
    }
}
