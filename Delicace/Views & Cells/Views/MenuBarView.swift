//
//  MenuBarView.swift
//  Delicace
//
//  Created by C4Q on 3/25/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class MenuBarView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
        
        let menuBarItems = ["ALL", "TRENDING", "NEW", "FAVORITES"]
        let menuBarCellID = "menuBarCell"
        
        lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            cv.showsHorizontalScrollIndicator = false
            cv.backgroundColor = UIColor.clear
            return cv
        }()
      
    
    override init(frame: CGRect){
            super.init(frame: frame)
            setupCollectionView()
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
            return menuBarItems.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuBarCellID, for: indexPath) as! MenuBarCell
            cell.menuBarLabel.text = menuBarItems[indexPath.item]
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: frame.width*0.285, height: frame.height)
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

                return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
