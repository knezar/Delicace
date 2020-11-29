//
//  MenuBarView.swift
//  Delicace
//
//  Created by C4Q on 3/25/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//


import UIKit

class MenuBarView: UIView {
    
    // MARK: - Properties
    var collectionOption: Int?
    //    var menuBarItems: [String]?
    weak var delegate: CollectionScrollDelegate?
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
    
    // MARK: - init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupCollectionView()
        setupRedBarEffect()
        selectItemAtIndex(index: 0)
    }
    
     init(collectionOption: Int) {
        self.collectionOption = collectionOption
        super.init(frame: .zero)
        setupCollectionView()
        setupRedBarEffect()
        selectItemAtIndex(index: 0)
     }
    // MARK: - Private
    //    private func
    private func setupRedBarEffect(){
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
        collectionView.fillSuperView()
    }
    
    private func selectItemAtIndex(index: Int) {
        let selectedItem = IndexPath(item: index, section: 0)
        collectionView.selectItem(at: selectedItem, animated: false, scrollPosition: UICollectionView.ScrollPosition())
    }
    
    private func animateRedBar(index: Int) {
        let x = CGFloat(index) * frame.width/3
        redBarLeftAnchorConstraint?.constant = x
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
}
// MARK: - Collection DataSource
extension MenuBarView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionNumber = collectionOption else { return 0 }
//        print(sectionNumber)
        let section = CollectionOptions(rawValue: sectionNumber)
        switch section {
        case .Main:
            print("this is main flaoting menu \(MainOptions.allCases.count)")
            
            return MainOptions.allCases.count
        case .Profile:
            print("this is profile floating menu")
            
            
            return ProfileOptions.allCases.count
        case .CookBook:
            
            print("this is cookbook ")
            
            return CookBookOptions.allCases.count
        case .none:
            print("damn it")
            return 0
        }
        //        return test.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuBarCellID, for: indexPath) as! MenuBarCell
        
        guard let sectionNumber = collectionOption else { return UICollectionViewCell() }
        let section = CollectionOptions(rawValue: sectionNumber)
        switch section {
        case .Main:
            let text = MainOptions(rawValue: indexPath.item)?.description
            cell.menuBarLabel.text = text
        case .Profile:
            let text = ProfileOptions(rawValue: indexPath.item)?.description
            cell.menuBarLabel.text = text
            
        case .CookBook:
            let text =  CookBookOptions(rawValue: indexPath.item)?.description
            cell.menuBarLabel.text = text
        case .none: break
        }
        
        return cell
    }
}

// MARK: - Collection FlowLayout Delegate
extension MenuBarView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (bounds.width)/3, height: bounds.height)
    }
}

// MARK: - Collection Selection Delegate
extension MenuBarView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.scrollToCellAtIndex(index: indexPath.item)
        animateRedBar(index: indexPath.item)
    }
}

// MARK: - Collection Selection Delegate
extension MenuBarView: CollectionSelectionDelegate {
    func selectCellAtIndex(index: Int) {
        selectItemAtIndex(index: index)
        animateRedBar(index: index)
    }
    
    
}
