//
//  ProfileController.swift
//  Delicace
//
//  Created by Nezar Khabar on 10/13/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    
    
    // MARK: - Properties
    
    let graphicHelper = GraphicHelper()
    let imageItems = ["Rec-1", "Rec-2", "Rec-3", "Rec-4", "Rec-5"]
    let titleItems = ["Chermoula couscous", "Flaky chicken and almond pie", "Chermoula eggplant", "Garam masala bastilla", "Goat tagine with almonds"]
    let recipesCellID = "recipesCell"
//    weak var menuBarView: MenuBarView!
    
    // MARK: - Outlets
    
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var shadedView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var menuBarView: MenuBarView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Lifecycle
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        UINavigationBar.appearance().isTranslucent = true
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.isTranslucent = false
        let bounds = self.navigationController!.navigationBar.frame
        if let image = graphicHelper.getGradientImage(bounds: bounds) {
            navigationBarAppearace.setBackgroundImage(image, for: .default)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigNavUI()
        setNavBarIsTranslucent()
        configureMenuBarView()
        configureCollectionView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        configureUserUI()
        
        
    }
    
    // MARK: - Private
    
    
    func configureMenuBarView() {
//        let menuBarView = MenuBarView()
        let menuBarItems = ["Favorites", "To Try", "My Recipes"]
        menuBarView.menuBarItems = menuBarItems
        
        
        
    }
    
    func configureUserUI() {
        userImage.image = #imageLiteral(resourceName: "obama")
        userImage.layer.borderWidth = 3
        userImage.layer.borderColor = UIColor.white.cgColor
        userImage.layer.cornerRadius = (userImage.bounds.height) / 2
        userImage.clipsToBounds = true
        
        nameLabel.text = " Barrack Obama"
        locationLabel.text = "Washington, D.C"
    }
    
    func ConfigNavUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.barStyle = .black
        navigationItem.leftBarButtonItem = navButtonConfiguration(image: #imageLiteral(resourceName: "Cancel"), selector:  #selector(cancelButtonToggeled))
        //        navigationItem.rightBarButtonItem = navButtonConfiguration(image: #imageLiteral(resourceName: "Search Icon"), selector:  #selector(addButtonToggeled))
    }
    func navButtonConfiguration(image: UIImage, selector: Selector) -> UIBarButtonItem {
        let barButton = UIBarButtonItem(image: image.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: selector)
        return barButton
    }
    
    
    func setNavBarIsTranslucent() {
        let navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.isTranslucent = true
        
        navigationBarAppearace.setBackgroundImage(UIImage(), for: .default)
        navigationBarAppearace.shadowImage = UIImage()
    }
    
    
    private func configureCollectionView() {
        
        
        collectionView.register(UINib(nibName:"RecipesCell", bundle: nil), forCellWithReuseIdentifier: recipesCellID)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = CustomFlowLayout()
        collectionView.showsHorizontalScrollIndicator = false
    }
    // MARK: - Actions
    
    @objc func cancelButtonToggeled(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addButtonToggeled(){
        print("Search Button Pressed")
        
    }
    
}


// MARK: - UICollectionViewDelegate
extension ProfileController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension ProfileController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recipesCellID, for: indexPath) as! RecipesCell
        
        
        cell.titleLabel.text = titleItems[indexPath.row]
        cell.recipeImage.image = UIImage(named: imageItems[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ProfileController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height/3.5)
        
    }
}
