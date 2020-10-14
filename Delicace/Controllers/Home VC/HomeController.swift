//
//  ViewController.swift
//  Delicace
//
//  Created by C4Q on 4/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var specialsCV: UICollectionView!
    @IBOutlet weak var menuBarView: MenuBarView!
    @IBOutlet weak var recipesCV: UICollectionView!
    
    // MARK: - Properties
    
    let graphicHelper = GraphicHelper()
    let imageItems = ["Rec-1", "Rec-2", "Rec-3", "Rec-4", "Rec-5"]
    let titleItems = ["Chermoula couscous", "Flaky chicken and almond pie", "Chermoula eggplant", "Garam masala bastilla", "Goat tagine with almonds"]
    var delegate: HomeControllerDelegate?
    let specialsCellID = "specialsCell"
    let recipesCellID = "recipesCell"
    
    
    
    
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = .myBgColor
        configureNavBar()
        configureMainCollectionView()
        
    }
    
    // MARK: - Private
    private func configureFloatingMenu() {
        
        
    }
    
    private func configureNavBar() {
        navigationItem.title = "Good Food"
        navigationItem.leftBarButtonItem =  navButtonConfiguration(image: #imageLiteral(resourceName: "Menu Icon"), selector: #selector (handleMenuButtonPressed))
        navigationItem.rightBarButtonItem =  navButtonConfiguration(image: #imageLiteral(resourceName: "Search Icon"), selector: #selector (handleSearchButtonPressed))
    }
    
 
    func navButtonConfiguration(image: UIImage, selector: Selector) -> UIBarButtonItem {
        let barButton = UIBarButtonItem(image: image.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: selector)
        return barButton
    }
    private func configureMainCollectionView() {
        self.specialsCV.register(UINib(nibName:"SpecialsCell", bundle: nil), forCellWithReuseIdentifier: specialsCellID)
        specialsCV.delegate = self
        specialsCV.dataSource = self
        recipesCV.collectionViewLayout = CustomFlowLayout()
        specialsCV.showsHorizontalScrollIndicator = false
        
        recipesCV.register(UINib(nibName:"RecipesCell", bundle: nil), forCellWithReuseIdentifier: recipesCellID)
        recipesCV.delegate = self
        recipesCV.dataSource = self
        recipesCV.collectionViewLayout = CustomFlowLayout()
        recipesCV.showsHorizontalScrollIndicator = false
    }
    
    // MARK: - Actions
    @objc func handleSearchButtonPressed() {
        print("search button pressed")
    }
    
    @objc func handleMenuButtonPressed() {
        delegate?.slideOutMenuToggled(ForMenuOption: nil)
    }
    
}

// MARK: - UICollectionViewDelegate
extension HomeController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension HomeController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == recipesCV {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recipesCellID, for: indexPath) as! RecipesCell
            
            cell.titleLabel.text = titleItems[indexPath.row]
            cell.recipeImage.image = UIImage(named: imageItems[indexPath.item])
            
            return cell
        } else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: specialsCellID, for: indexPath) as! SpecialsCell
            
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == recipesCV {
            return CGSize(width: recipesCV.bounds.size.width, height: recipesCV.bounds.size.height/3.5)
        } else {
            return CGSize(width: specialsCV.bounds.width, height: specialsCV.bounds.size.height)
        }
    }
}
