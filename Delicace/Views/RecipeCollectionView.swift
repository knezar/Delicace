//
//  RecipeCollectionView.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/26/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class RecipeCollectionView: UIView {
    
    let recipeFeedCellID = "RecipeFeedCell"
    let trendingCellID = "TrendingCell"
    let recentCellID = "RecentCell"
//    var delegate: CustomCollectionDelegate?
    var homeVC: HomeController?
//    let menuBar
    
    lazy var recipeCollction: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .blue
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    
    
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMainCollectionView()
//        setupIndicatorView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupMainCollectionView()
//        setupIndicatorView()
    }
    
    
    func setupMainCollectionView() {
        
        recipeCollction.register(RecipeFeedCell.self, forCellWithReuseIdentifier: recipeFeedCellID)
        recipeCollction.register(TrendingCell.self, forCellWithReuseIdentifier: trendingCellID)
        recipeCollction.register(RecentCell.self, forCellWithReuseIdentifier: recentCellID)

        addSubview(recipeCollction)
        recipeCollction.translatesAutoresizingMaskIntoConstraints = false
        recipeCollction.topAnchor.constraint(equalTo: topAnchor).isActive = true
        recipeCollction.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        recipeCollction.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        recipeCollction.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        recipeCollction.scrollToItem(at: indexPath, at: .left, animated: true)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.move().x / frame.width
        print(index)
        homeVC?.selectCellAtIndex(index: Int(index))
//        let indexPath = IndexPath(item: Int(index), section: 0)
//        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
    }

}


// MARK: - UICollectionViewDelegate
extension RecipeCollectionView: UICollectionViewDelegate {

//    scrollmen
    
}


// MARK: - UICollectionViewDataSource
extension RecipeCollectionView: UICollectionViewDataSource {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: recipeFeedCellID, for: indexPath)
        } else if indexPath.item == 1 {
        return collectionView.dequeueReusableCell(withReuseIdentifier: trendingCellID, for: indexPath) as! TrendingCell
        } else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: recentCellID, for: indexPath)
        }
    }
}



// MARK: - UICollectionViewDelegateFlowLayout
extension RecipeCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
    
}
