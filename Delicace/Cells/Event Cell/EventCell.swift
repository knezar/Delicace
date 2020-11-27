//
//  EventCell.swift
//  Delicace
//
//  Created by Nezar Khabar on 10/31/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class EventCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var usersCV: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var shadedView: UIView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    // MARK: - Properties
    let usersCellID = "usersCV"
    
    
    
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureUI()
        
    }
    
    override func layoutSubviews() {
        
        calendarView.layer.borderWidth = 0.5
        calendarView.layer.borderColor = UIColor.myRed.cgColor
        calendarView.layer.cornerRadius = 4
        calendarView.clipsToBounds = true
    }
    // MARK: - Private
    
    func configureUI() {
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.myLightPink.cgColor
        clipsToBounds = true
        
        self.usersCV.register(UserCollectionCell.self, forCellWithReuseIdentifier: usersCellID)
        usersCV.delegate = self
        usersCV.dataSource = self
        usersCV.collectionViewLayout = UICollectionViewLayout()
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        usersCV.collectionViewLayout = layout
    }
    
}
// MARK: - CollectionView Delegate
extension EventCell: UICollectionViewDelegate {
    
    
    
}

// MARK: - CollectionView Datasource
extension EventCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: usersCellID, for: indexPath) as! UserCollectionCell
        if indexPath.row == 3 {
            cell.textLabel.text = "+7"
            cell.textLabel.backgroundColor = UIColor.myRed.withAlphaComponent(0.5)
            
        } else {
            cell.backgroundColor = .yellow
        }
        return cell
    }
}

// MARK: - CollectionView Flowlayout
extension EventCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: usersCV.bounds.size.height, height: usersCV.bounds.size.height)
    }
}
