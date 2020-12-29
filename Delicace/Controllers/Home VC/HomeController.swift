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
    @IBOutlet weak var dimmView: UIView!
    @IBOutlet weak var speciallsView: SpeicalsCollectionView!
    @IBOutlet weak var menuBarView: UIView!
    @IBOutlet weak var addButtonView: UIButton!
    @IBOutlet weak var recipeCollectionView: UIView!
    
    // MARK: - Properties
    
    //    guard let window = UIApplication.shared.keyWindow else {return}
    var isExpanded: Bool = false
    let graphicHelper = GraphicHelper()
    var delegate: HomeControllerDelegate?
    var menu: MenuBarView!
    var recipeCV: RecipeCollectionView!
    private var recipeSearch = [SearchResults]()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dimmView.alpha = 0
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
        configureNavBar()
    }
    override func viewWillLayoutSubviews() {
        
    }
    
    // MARK: - Private
    func loadTestData() {
        for data in RecipeTestDataModel.allCases {
            let recipedata = SearchResults(id: data.id, title: data.description, image: data.recipeImage, readyInMinutes: data.time, aggregateLikes: data.likes, servings: data.servings, summary: data.summary)
            recipeSearch.append(recipedata)
        }
        speciallsView.specialsData = recipeSearch
        
    }

    private func configureFloatingMenu() {
        menu = MenuBarView(collectionOption: 0)
        recipeCV = RecipeCollectionView(collectionOption: .Main)
        menu.delegate = recipeCV
        recipeCV.delegate = menu
        recipeCollectionView.addSubview(recipeCV)
        recipeCV.fillSuperView()
        menuBarView.addSubview(menu)
        menu.fillSuperView()
    }
    
    
    
    private func configureNavBar() {
        navigationItem.title = "Good Food"
        navigationItem.leftBarButtonItem =  navButtonConfiguration(image: #imageLiteral(resourceName: "Menu Icon"), selector: #selector (handleMenuButtonPressed))
        navigationItem.rightBarButtonItem =  navButtonConfiguration(image: #imageLiteral(resourceName: "Search Icon"), selector: #selector (handleSearchButtonPressed))
    }
    private func navButtonConfiguration(image: UIImage, selector: Selector) -> UIBarButtonItem {
        let barButton = UIBarButtonItem(image: image.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: selector)
        return barButton
    }
    
    private func expandButtonView() {
        graphicHelper.animateButtonTransform(rotateView: addButtonView, transformBy: CGAffineTransform(rotationAngle: CGFloat.pi/4), expandView: expandingView, expandBy: CGAffineTransform(scaleX: 4.25, y: 4), showView: expandingView, alpha:  1)
        
    }
    private func shrinkButtonView() {
        graphicHelper.animateButtonTransform(rotateView: addButtonView, transformBy: CGAffineTransform.identity, expandView: expandingView, expandBy: CGAffineTransform.identity, showView: expandingView, alpha: 0)
    }
    private func showDimmedView(selector: Selector) {
        graphicHelper.dimmView(view: dimmView)
        let tapGesture = UITapGestureRecognizer(target: self, action: selector)
        dimmView.addGestureRecognizer(tapGesture)
    }
    func dissmissDimmedView() {
        graphicHelper.dismissDimmedView(view: dimmView)
    }
    
    // MARK: - Actions
    @objc func handleSearchButtonPressed() {
        print("search button pressed")
    }
    
    @objc func handleMenuButtonPressed() {
        delegate?.slideOutMenuToggled(ForMenuOption: nil)
        if isExpanded {
            shrinkButtonView()
            dissmissDimmedView()
            isExpanded = !isExpanded
        } 
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if isExpanded {
            shrinkButtonView()
            dissmissDimmedView()
        } else {
            showDimmedView(selector: #selector(addButtonPressed))
            expandButtonView()
            
        }
        isExpanded = !isExpanded
    }
}
