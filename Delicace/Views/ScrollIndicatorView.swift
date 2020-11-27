//
//  ScrollIndicatorView.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/24/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit


class ScrollIndicatorView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var indicators: Int?
    var width: CGFloat?
    var height: CGFloat?
    
    let indicatorCellID = "indicatorCell"
    var specialsView: SpeicalsCollectionView?
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .myBgColor
        return cv
    }()
    
    init(indicators: Int, width: CGFloat, height: CGFloat) {
        self.indicators = indicators
        self.width = width
        self.height = height
        
        super.init(frame: CGRect.zero)
        setupCollectionView()
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCollectionView()
    }
    private func setupCollectionView(){
        collectionView.backgroundColor = .clear
        collectionView.register(IndicatorCell.self, forCellWithReuseIdentifier: indicatorCellID)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        specialsView?.scrollToMenuIndex(menuIndex: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let indicators = indicators else {return 1}
        return indicators
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indicatorCellID, for: indexPath) as! IndicatorCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let indicators = indicators, let width = width, let height = height else {return CGSize(width: bounds.width, height: bounds.height)}
        return CGSize(width: width/CGFloat(indicators), height: height*0.99)
    }
}

