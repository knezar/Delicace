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
    @IBOutlet weak var expandingView: UIView!

    @IBOutlet weak var speciallsView: SpeicalsCollectionView!
    @IBOutlet weak var menuBarView: MenuBarView!
    @IBOutlet weak var addButtonView: UIButton!
    @IBOutlet weak var recipesCV: RecipeCollectionView!
    
    // MARK: - Properties
    
    //    guard let window = UIApplication.shared.keyWindow else {return}
    var isDimmed: Bool = false
    let graphicHelper = GraphicHelper()
    
    var delegate: HomeControllerDelegate?
    let specialsCellID = "specialsCell"
    let recipesCellID = "recipesCell"    
    private var recipeSearch = [SearchResults]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        configureFloatingMenu()
        loadTestData()
        //        RecipeSearchAPI.manager.fetchRecipes(url: " ") { (recipes) in
        //            print(recipes.results)
        //            self.recipeSearch = recipes.results
        //        } errorHandler: { (error) in
        //            print(error)
        //        }
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isTranslucent = false
    }
    override func viewWillLayoutSubviews() {
        configureNavBar()
    }
    
    // MARK: - Private
    
    func loadTestData() {
        for data in RecipeTestDataModel.allCases {
            let recipedata = SearchResults(id: data.id, title: data.description, image: data.recipeImage, readyInMinutes: data.time, aggregateLikes: data.likes, servings: data.servings, summary: data.summary)
            recipeSearch.append(recipedata)
        }
        recipesCV.recipesData = recipeSearch
        speciallsView.specialsData = recipeSearch
        
    }
    private func configureFloatingMenu() {
        menuBarView.homeVC = self
        var menuBarItems = [String]()
        for option in HomeMenuOptions.allCases {
            menuBarItems.append(option.description)
        }
        menuBarView.menuBarItems = menuBarItems
        
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
    
    private func fullDimmView() {
        guard let window = UIApplication.shared.keyWindow else {return}
        let dimmView = graphicHelper.dimmScreen(view: view)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleMenuButtonPressed))
        
        dimmView.addGestureRecognizer(tapGesture)
        window.addSubview(dimmView)
        dimmView.translatesAutoresizingMaskIntoConstraints = false
        dimmView.topAnchor.constraint(equalTo:  window.topAnchor).isActive = true
        dimmView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dimmView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        dimmView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func dimmView() {
        let dimmView = graphicHelper.dimmScreen(view: view)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addButtonPressed))
        dimmView.addGestureRecognizer(tapGesture)
        
        //        guard let window = UIApplication.shared.keyWindow else {return}
        view.addSubview(dimmView)
        dimmView.translatesAutoresizingMaskIntoConstraints = false
        dimmView.topAnchor.constraint(equalTo:  view.topAnchor).isActive = true
        dimmView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dimmView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        dimmView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        view.bringSubviewToFront(expandingView)
        view.bringSubviewToFront(addButtonView)
    }
    
    private func dissmissDimmedView() {
        graphicHelper.dismissDimmedView()
    }
    
    // MARK: - Actions
    @objc func handleSearchButtonPressed() {
        print("search button pressed")
    }
    
    @objc func handleMenuButtonPressed() {
        delegate?.slideOutMenuToggled(ForMenuOption: nil)
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if isDimmed {
            dissmissDimmedView()
            graphicHelper.animateButtonTransform(viewToRotate: addButtonView, rotate: CGAffineTransform.identity, ViewtoExpand: expandingView, expand: CGAffineTransform.identity, alpha: 0)
        } else {
            dimmView()
            graphicHelper.animateButtonTransform(viewToRotate: addButtonView, rotate: CGAffineTransform(rotationAngle: CGFloat.pi/4), ViewtoExpand: expandingView, expand: CGAffineTransform(scaleX: 4.25, y: 4), alpha: 1)
        }
        isDimmed = !isDimmed
    }
}
