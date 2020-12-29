//
//  RecipeCollectionView.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/26/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class RecipeCollectionView: UIView {
    
    
    // MARK: - Properties
    var collectionOption: CollectionOptions.AllCases.Element?
    weak var delegate: CollectionSelectionDelegate?
    lazy var recipeCollction: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    
//    let int = 0
    
    // MARK: - init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupMainCollectionView()
    }
    
     init(collectionOption: CollectionOptions.AllCases.Element) {
        self.collectionOption = collectionOption
        super.init(frame: .zero)
        setupMainCollectionView()
     }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupMainCollectionView()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupMainCollectionView()
//    }
    
    // MARK: - Private
    private func setupMainCollectionView() {
        
        collectionOption = .Main
        guard let collectionOption = collectionOption  else {return}
        print(CollectionOptions.Main)
//        let collectionOption = CollectionOptions(rawValue: collectionOption)
        switch collectionOption {
        case .Main:
            MainOptions.allCases.forEach { (cell) in
                recipeCollction.register(cell.cell, forCellWithReuseIdentifier: cell.cellID)
            }
        case .Profile:
            ProfileOptions.allCases.forEach { (cell) in
                recipeCollction.register(cell.cell, forCellWithReuseIdentifier: cell.cellID)
            }
        case .CookBook:
            guard let cell = ProfileOptions(rawValue: 2) else {return}
            recipeCollction.register(cell.cell, forCellWithReuseIdentifier: cell.cellID)
//        case .none: break
        }
        addSubview(recipeCollction)
        recipeCollction.fillSuperView()
    }
}


// MARK: - UICollectionViewDelegate
extension RecipeCollectionView: UICollectionViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.move().x / frame.width
        delegate?.selectCellAtIndex(index: Int(index))
    }
    
}


// MARK: - UICollectionViewDataSource
extension RecipeCollectionView: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let collectionOption = collectionOption else {return 1}
//        let section = CollectionOptions(rawValue: collectionOption)
        switch collectionOption {
        case .Main: return MainOptions.allCases.count
        case .Profile: return ProfileOptions.allCases.count
        case .CookBook: return CookBookOptions.allCases.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionOption = collectionOption else {return UICollectionViewCell()}
//        let collectionOption = CollectionOptions(rawValue: collectionOption)
        switch collectionOption {
        case .Main: return collectionView.dequeueReusableCell(withReuseIdentifier: MainOptions(rawValue: indexPath.item)!.cellID, for: indexPath)
        case .Profile: return collectionView.dequeueReusableCell(withReuseIdentifier: ProfileOptions(rawValue: indexPath.item)!.cellID, for: indexPath)
        case .CookBook:
            let cell = ProfileOptions(rawValue: 2)
            return collectionView.dequeueReusableCell(withReuseIdentifier: cell!.cellID, for: indexPath)
        }
    }
}



// MARK: - UICollectionViewDelegateFlowLayout
extension RecipeCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
    
}

extension RecipeCollectionView: CollectionScrollDelegate {
    func scrollToCellAtIndex(index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        recipeCollction.scrollToItem(at: indexPath, at: .left, animated: true)
    }
}
