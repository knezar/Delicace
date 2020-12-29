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
    var menu: MenuBarView!
    var recipeCV: RecipeCollectionView!
   
    
    // MARK: - Outlets
    
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var shadedView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var recipeCollectionView: UIView!
    @IBOutlet weak var menuBarView: UIView!
        
    // MARK: - Lifecycle
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        UINavigationBar.appearance().isTranslucent = true
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.isTranslucent = false
        navigationBarAppearace.barStyle = .black
        let bounds = self.navigationController!.navigationBar.frame
        if let image = graphicHelper.getGradientImage(bounds: bounds) {
            navigationBarAppearace.setBackgroundImage(image, for: .default)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigNavUI()
        setNavBarIsTranslucent()
        configureCollections()
//        configureCollectionView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        configureUserUI()
        
    }
    
    // MARK: - Private
    private func configureCollections() {
        menu = MenuBarView(collectionOption: 1)
        recipeCV = RecipeCollectionView(collectionOption: .Profile)
        menu.delegate = recipeCV
        recipeCV.delegate = menu
        recipeCollectionView.addSubview(recipeCV)
        recipeCV.fillSuperView()
        menuBarView.addSubview(menu)
        menu.fillSuperView()
    }
    
    private func configureUserUI() {
        userImage.image = #imageLiteral(resourceName: "golden-eagle")
        userImage.layer.borderWidth = 3
        userImage.layer.borderColor = UIColor.white.cgColor
        userImage.setCornerRadius(cornerR: (userImage.bounds.height) / 2)
        nameLabel.text = " Golden Eagle"
        locationLabel.text = "Denver, CO"
    }
    
    private func ConfigNavUI() {
        view.backgroundColor = .myBgColor
        navigationController?.navigationBar.barStyle = .black
        navigationItem.leftBarButtonItem = navButtonConfiguration(image: #imageLiteral(resourceName: "Cancel"), selector:  #selector(cancelButtonToggeled))
        //        navigationItem.rightBarButtonItem = navButtonConfiguration(image: #imageLiteral(resourceName: "Search Icon"), selector:  #selector(addButtonToggeled))
    }
    func navButtonConfiguration(image: UIImage, selector: Selector) -> UIBarButtonItem {
        let barButton = UIBarButtonItem(image: image.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: selector)
        return barButton
    }
    
    
    private func setNavBarIsTranslucent() {
        let navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.isTranslucent = true
        
        navigationBarAppearace.setBackgroundImage(UIImage(), for: .default)
        navigationBarAppearace.shadowImage = UIImage()
    }
    // MARK: - Actions
    
    @objc func cancelButtonToggeled(){
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func addButtonToggeled(){
        print("Search Button Pressed")
        
    }
    
}


// MARK: - UICollectionViewDelegate
extension ProfileController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
//extension ProfileController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return imageItems.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recipesCellID, for: indexPath) as! RecipesCell
//
//
//        cell.titleLabel.text = titleItems[indexPath.row]
//        cell.recipeImage.image = UIImage(named: imageItems[indexPath.item])
//        return cell
//    }
//}
//
//// MARK: - UICollectionViewDelegateFlowLayout
//extension ProfileController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height/3.5)
//
//    }
//}
