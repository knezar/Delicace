//
//  FavoritesController.swift
//  Delicace
//
//  Created by Nezar Khabar on 10/13/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class CalendarController: UIViewController {
    
    
    // MARK: - Properties
    
    let titleItems = ["Chermoula couscous", "Flaky chicken and almond pie", "Chermoula eggplant", "Garam masala bastilla", "Goat tagine with almonds"]
    let imageItems = ["Rec-1", "Rec-2", "Rec-3", "Rec-4", "Rec-5"]
//    let specialsCellID = "specialsCell"
    let recipesCellID = "recipesCell"
    
    
    // MARK: - Outlets
    @IBOutlet weak var eventCV: UICollectionView!
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigUI()
        configureMainCollectionView()
    }
    
    // MARK: - Private
    
    private func configureMainCollectionView() {
        self.eventCV.register(UINib(nibName:"RecipesCell", bundle: nil), forCellWithReuseIdentifier: recipesCellID)
        eventCV.delegate = self
        eventCV.dataSource = self
        eventCV.collectionViewLayout = CustomFlowLayout()
        eventCV.showsVerticalScrollIndicator = false
        
        eventCV.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0)
//        eventCV.contentmi
    }
    
    
    
    func ConfigUI() {
        view.backgroundColor = .mainBlue
        navigationItem.title = "Events"
        navigationController?.navigationBar.barStyle = .black
        navigationItem.leftBarButtonItem = navButtonConfiguration(image: #imageLiteral(resourceName: "Cancel"), selector:  #selector(cancelButtonToggeled))
        navigationItem.rightBarButtonItem = navButtonConfiguration(image: #imageLiteral(resourceName: "addClear"), selector:  #selector(addButtonToggeled))
    }
    func navButtonConfiguration(image: UIImage, selector: Selector) -> UIBarButtonItem {
        let barButton = UIBarButtonItem(image: image.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: selector)
        return barButton
    }
    
    // MARK: - Actions
    
    @objc func cancelButtonToggeled(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addButtonToggeled(){
        print("Search Button Pressed")
        
    }
    
}

// MARK: - CollectionView DataSource

extension CalendarController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recipesCellID, for: indexPath) as! RecipesCell
        cell.layer.cornerRadius = 25
        cell.clipsToBounds = true
            cell.titleLabel.text = titleItems[indexPath.row]
            cell.recipeImage.image = UIImage(named: imageItems[indexPath.item])
            return cell
    }
    
    
}

// MARK: - CollectionView Delegate

extension CalendarController: UICollectionViewDelegate {
    
}


// MARK: - CollectionView Flowlayout
extension CalendarController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: eventCV.bounds.size.width-35, height: eventCV.bounds.size.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
