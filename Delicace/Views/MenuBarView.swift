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
//    var delegate: CustomCollectionDelegate?
    var homeVC: HomeController?
    let menuBarCellID = "menuBarCell"
    var redBarLeftAnchorConstraint: NSLayoutConstraint?

    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .myBgColor
        return cv
    }()
    
    let redBarView: UIView = {
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
        addSubview(redBarView)
        redBarView.translatesAutoresizingMaskIntoConstraints = false
        redBarLeftAnchorConstraint = redBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        redBarLeftAnchorConstraint?.isActive = true
        redBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        redBarView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3).isActive = true
        redBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
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
    
    func animateRedBar(index: Int) {
        let x = CGFloat(index) * frame.width/3
        redBarLeftAnchorConstraint?.constant = x
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
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
        homeVC?.scrollToCellAtIndex(index: indexPath.item)
        animateRedBar(index: indexPath.item)

    }
}
