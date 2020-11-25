//
//  RecipeBookViewController.swift
//  Delicace
//
//  Created by Nezar Khabar on 10/13/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class RecipeBookController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var recipesCV: UICollectionView!
    
    
    // MARK: - Properties
    let imageItems = ["Rec-1", "Rec-2", "Rec-3", "Rec-4", "Rec-5"]
    let titleItems = ["Chermoula couscous", "Flaky chicken and almond pie", "Chermoula eggplant", "Garam masala bastilla", "Goat tagine with almonds"]
    var delegate: HomeControllerDelegate?
    let recipesCellID = "recipesCell"
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigUI()
        configureMainCollectionView()
    }
    
    // MARK: - Private
    func ConfigUI() {
        view.backgroundColor = .white
        navigationItem.title = "My Recipes"
        navigationController?.navigationBar.barStyle = .black
        navigationItem.leftBarButtonItem = navButtonConfiguration(image: #imageLiteral(resourceName: "Cancel"), selector:  #selector(cancelButtonToggeled))
        navigationItem.rightBarButtonItem = navButtonConfiguration(image: #imageLiteral(resourceName: "addClear"), selector:  #selector(addButtonToggeled))
    }
    func navButtonConfiguration(image: UIImage, selector: Selector) -> UIBarButtonItem {
        let barButton = UIBarButtonItem(image: image.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: selector)
        return barButton
    }
    
    private func configureMainCollectionView() {
        recipesCV.register(UINib(nibName:"RecipesCell", bundle: nil), forCellWithReuseIdentifier: recipesCellID)
        recipesCV.delegate = self
        recipesCV.dataSource = self
        recipesCV.collectionViewLayout = CustomFlowLayout()
        recipesCV.showsHorizontalScrollIndicator = false
    }
    
    // MARK: - Actions
    
    @objc func cancelButtonToggeled(){
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func addButtonToggeled(){
    print("Add Button Pressed")
        
    }

}


// MARK: - UICollectionViewDelegate
extension RecipeBookController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension RecipeBookController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == recipesCV {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recipesCellID, for: indexPath) as! RecipesCell
            
            cell.titleLabel.text = titleItems[indexPath.row]
            cell.recipeImage.image = UIImage(named: imageItems[indexPath.item])
            
            return cell
        
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RecipeBookController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: recipesCV.bounds.size.width, height: recipesCV.bounds.size.width/2.5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        }
}
