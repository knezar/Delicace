//
//  SpeicalsCollectionView.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/24/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class SpeicalsCollectionView: UIView {
    
    // MARK: - Propreties
//    let indicatorCV: ScrollIndicatorView
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    let items = 5
//    let width = screenWidth * 0.125
//    let height = width / 5
    var specialsData = [SearchResults]() {
        didSet {
            DispatchQueue.main.async {
                self.specialsCollctions.reloadData()
            }
        }
    }
    let specialsCellID = "specialsCell"
    
    
    lazy var indicatorCV: ScrollIndicatorView = {
        let width = screenWidth * 0.125
        let height = width / CGFloat(items)
        let icv = ScrollIndicatorView(indicators: items, width: width, height: height)
        icv.specialsView = self
        
    
        return icv
    }()
    
    lazy var specialsCollctions: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .myBgColor
        cv.isPagingEnabled = true
        return cv
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        setupIndicatorView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCollectionView()
        setupIndicatorView()
    }
    // MARK: - Private
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        specialsCollctions.scrollToItem(at: indexPath, at: .left, animated: true)
    }
    
    private func setupCollectionView() {
        specialsCollctions.register(UINib(nibName: "SpecialsCell", bundle: nil), forCellWithReuseIdentifier: specialsCellID)
        specialsCollctions.dataSource = self
        specialsCollctions.delegate = self
        addSubview(specialsCollctions)
        specialsCollctions.fillSuperView()
    }
    
    private func setupIndicatorView() {
        let width = screenWidth * 0.125
        let height = width / CGFloat(items)
//
//        guard var indicatorCV = indicatorCV else {}
//        indicatorCV = ScrollIndicatorView(indicators: 5, width: width, height: height)
        indicatorCV.specialsView = self
        addSubview(indicatorCV)
        indicatorCV.translatesAutoresizingMaskIntoConstraints = false
        indicatorCV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        indicatorCV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        indicatorCV.heightAnchor.constraint(equalToConstant: height).isActive = true
        indicatorCV.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
}

// MARK: - UICollectionViewDelegate
extension SpeicalsCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let recipeDetailController = RecipeController(nibName: "RecipeController", bundle: nil)
//                recipeDetailController.x = indexPath.row
        
//                navigationController?.pushViewController(recipeDetailController, animated: true)
        }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.move().x / frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        indicatorCV.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
    }
    
}

// MARK: - UICollectionViewDataSource
extension SpeicalsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return specialsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: specialsCellID, for: indexPath) as! SpecialsCell
            cell.recipeImage.image = UIImage(named: specialsData[indexPath.row].image)
            cell.titleLabel.text = specialsData[indexPath.row].title
            return cell
        
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SpeicalsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: specialsCollctions.bounds.size.width, height: specialsCollctions.bounds.size.height)
        
    }
}

