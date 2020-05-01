//
//  FeedViewController.swift
//  Delicace
//
//  Created by C4Q on 3/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    // MARK: - Properties
    let imageItems = ["Rec-1", "Rec-2", "Rec-3", "Rec-4", "Rec-5"]
    let titleItems = ["Chermoula couscous", "Flaky chicken and almond pie", "Chermoula eggplant", "Garam masala bastilla", "Goat tagine with almonds"]
    
    var myUserData = [UserProfile](){
        didSet {
            DispatchQueue.main.async {
                self.mainCollectionView.reloadData()
            }
        }
    }
    let graphicHelper = GraphicHelper()
    var delegate: HomeControllerDelegate?
    let mainCollectionCellID = "mainCollectionCell"
//    lazy var menuBar: MenuBarView = {
//          let mb = MenuBarView()
//          mb.isHidden = false
//          return mb
//      }()

    // MARK: - Outlets
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavItems()
        configureMainCollectionView()
        navigationItem.title = "Feed"

//        UserGenApi.manager.fetchMessages(url: "https://randomuser.me/api/?results=5", completionHandler: { (onlinedata) in
//            self.myUserData = onlinedata
//        }, errorHandler: {print($0)})
//        print(myUserData[0].cell)
    }
    
    // MARK: - Private
//    func configureMenuBar() {
//        view.addSubview(menuBar)
//        menuBar.translatesAutoresizingMaskIntoConstraints = false
//        menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
//        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        menuBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
//    }
    
    func configureNavItems() {
        navigationItem.leftBarButtonItem =  navButtonConfiguration(image: #imageLiteral(resourceName: "Menu Icon"), selector: #selector (handleMenuButtonPressed))
        navigationItem.rightBarButtonItem =  navButtonConfiguration(image: #imageLiteral(resourceName: "Search Icon"), selector: #selector (handleSearchButtonPressed))
    }
    
    func navButtonConfiguration(image: UIImage, selector: Selector) -> UIBarButtonItem {
        let barButton = UIBarButtonItem(image: image.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: selector)
        return barButton
    }
    
    func configureMainCollectionView() {
        self.mainCollectionView.register(UINib(nibName:"FeedCell", bundle: nil), forCellWithReuseIdentifier: mainCollectionCellID)
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.backgroundColor = UIColor.clear
        mainCollectionView.showsVerticalScrollIndicator = false
    }
    
    // MARK: - Actions
    @objc func handleSearchButtonPressed() {
        print("search button pressed")
    }
    
    @objc func handleMenuButtonPressed() {
        delegate?.slideOutMenuToggled()
    }
}

    // MARK: - UICollectionViewDelegate
extension FeedViewController: UICollectionViewDelegate {

}

// MARK: - UICollectionViewDataSource
extension FeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return myUserData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainCollectionCellID, for: indexPath) as! FeedCell
        cell.titleLabel.text = "\(myUserData[indexPath.item].name.first) \(myUserData[indexPath.item].name.last) is making \(myUserData[indexPath.item].location.state)"
            cell.recipeImage.image = UIImage(named: imageItems[indexPath.item])
        UserGenApi.manager.getAvatarPic(urlString: myUserData[indexPath.item].picture.medium, completionHandler: { (image) in
            cell.profileImage.image = image
        }, errorHandler: {print($0)})
         return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height * 0.4)
    }
}
