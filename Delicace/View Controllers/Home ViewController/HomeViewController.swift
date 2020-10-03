//
//  HomeViewController.swift
//  Delicace
//
//  Created by C4Q on 4/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    let imageItems = ["Rec-1", "Rec-2", "Rec-3", "Rec-4", "Rec-5"]
    let titleItems = ["Chermoula couscous", "Flaky chicken and almond pie", "Chermoula eggplant", "Garam masala bastilla", "Goat tagine with almonds"]
    var delegate: HomeControllerDelegate?
    let categoryCellID = "categoryCell"
    let recipeCellID = "recipeCell"

    
    // MARK: - Outlets
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var RecipeCollectionView: UICollectionView!
    
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavItems()
        configureMainCollectionView()
        navigationItem.title = "Good Food"
    }
    
//    overr
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//
//        coordinator.animate(alongsideTransition: { (_) in
//            self.RecipeCollectionView.collectionViewLayout.shouldInvalidateLayout(forBoundsChange: CGRect())
//            self.categoryCollectionView.collectionViewLayout.invalidateLayout()
//        }, completion: nil)
//    }
    // MARK: - Private
    func configureNavItems() {
        navigationItem.leftBarButtonItem =  navButtonConfiguration(image: #imageLiteral(resourceName: "Menu Icon"), selector: #selector (handleMenuButtonPressed))
        navigationItem.rightBarButtonItem =  navButtonConfiguration(image: #imageLiteral(resourceName: "Search Icon"), selector: #selector (handleSearchButtonPressed))
    }

    func navButtonConfiguration(image: UIImage, selector: Selector) -> UIBarButtonItem {
        let barButton = UIBarButtonItem(image: image.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: selector)
        return barButton
    }
    
    func configureMainCollectionView() {
        self.categoryCollectionView.register(UINib(nibName:"CategoryCell", bundle: nil), forCellWithReuseIdentifier: categoryCellID)
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
//        categoryCollectionView.collectionViewLayout = CustomFlowLayout()
        categoryCollectionView.backgroundColor = .green
        categoryCollectionView.showsHorizontalScrollIndicator = false

        self.RecipeCollectionView.register(UINib(nibName:"RecipeCell", bundle: nil), forCellWithReuseIdentifier: recipeCellID)
        RecipeCollectionView.delegate = self
        RecipeCollectionView.dataSource = self
//        RecipeCollectionView.collectionViewLayout = CustomFlowLayout()
        RecipeCollectionView.backgroundColor = UIColor.red
        RecipeCollectionView.showsHorizontalScrollIndicator = false
    }
    
    // MARK: - Actions
    @objc func handleSearchButtonPressed() {
        print("search button pressed")
    }
    
    @objc func handleMenuButtonPressed() {
        delegate?.slideOutMenuToggled()
//        RecipeCollectionView.collectionViewLayout.invalidateLayout()
//        categoryCollectionView.collectionViewLayout.invalidateLayout()
        
    }
    
}

    // MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {

}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return imageItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == RecipeCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recipeCellID, for: indexPath) as! RecipeCell

            cell.titleLabel.text = titleItems[indexPath.row]
            cell.recipeImage.image = UIImage(named: imageItems[indexPath.item])
            return cell
        } else {
//            let cell = UICollectionViewCell()
//            cell.backgroundColor = .blue
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCellID, for: indexPath) as! CategoryCell
            
            return cell
        }
         
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == RecipeCollectionView {
            return CGSize(width: RecipeCollectionView.frame.size.width * 0.9, height: RecipeCollectionView.frame.size.height * 0.95)
        } else {
            return CGSize(width: categoryCollectionView.frame.size.width * 0.55, height: categoryCollectionView.frame.size.height * 0.95)
        }
    }
}
