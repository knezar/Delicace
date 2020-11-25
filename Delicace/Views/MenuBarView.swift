//
//  MenuBarView.swift
//  Delicace
//
//  Created by C4Q on 3/25/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//


import UIKit

class MenuBarView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
//    let menuBarItems = ["Popular", "Trending", "Recent"]
    var menuBarItems: [String]?
    
    let menuBarCellID = "menuBarCell"
    var whiteBarLeftAnchorConstraint: NSLayoutConstraint?
    var homeVC: HomeController?

    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .myBgColor
        return cv
    }()
    
    let whiteBarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.myRed
        return view
    }()
    
//    init(menuBarItems: [String]) {
//
//        self.menuBarItems = menuBarItems
//        super.init(frame: CGRect.zero)
//    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCollectionView()
        setupWhiteBarEffect()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
        setupWhiteBarEffect()
    }
    
    private func setupWhiteBarEffect(){
        addSubview(whiteBarView)
        whiteBarView.translatesAutoresizingMaskIntoConstraints = false
        whiteBarLeftAnchorConstraint = whiteBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        whiteBarLeftAnchorConstraint?.isActive = true
        whiteBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        whiteBarView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3).isActive = true
        whiteBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    private func setupCollectionView(){
        collectionView.register(UINib(nibName:"MenuBarCell", bundle: nil), forCellWithReuseIdentifier: menuBarCellID)
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let test = menuBarItems else {return 3}
        return test.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuBarCellID, for: indexPath) as! MenuBarCell
        if let test = menuBarItems {
            cell.menuBarLabel.text = test[indexPath.item]
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (bounds.width)/3, height: bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        let x = CGFloat(indexPath.item) * frame.width/3
        whiteBarLeftAnchorConstraint?.constant = x
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
}
