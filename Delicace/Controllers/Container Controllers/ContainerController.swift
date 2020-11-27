//
//  ContainerController.swift
//  Delicace
//
//  Created by C4Q on 3/26/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    // MARK: - Properties
    var delegate: LoginControllerDelegate?
    var menuController: MenuController!
    var centerController: UIViewController!
    var homeController: HomeController!
    var dimmedView = UIView()
    private var heightConstraint: NSLayoutConstraint!
    private var widthConstraint: NSLayoutConstraint!
    private var xConstraint: NSLayoutConstraint!
    private var yConstraint: NSLayoutConstraint!
    var isExpanded = false
    var isDimmed = false
    let graphicHelper = GraphicHelper()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
        configureMenuController()
        configureDimmedView()


        
        view.backgroundColor = .myLightPink
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    // MARK: - Private
    func configureHomeController() {
        homeController = HomeController(nibName: "HomeController", bundle: nil)
        homeController.delegate = self
        centerController = CustomNavigationController(rootViewController: homeController)
        centerController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerController.view)
        heightConstraint = centerController.view.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        widthConstraint = centerController.view.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        xConstraint = centerController.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        yConstraint = centerController.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        NSLayoutConstraint.activate([heightConstraint, widthConstraint, xConstraint, yConstraint])
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    
    func configureMenuController() {
        let menuVC = MenuController()
        menuVC.delegate = self
        if menuController == nil {
            menuController = menuVC
            view.insertSubview(menuController.view, at: 0)
            menuController.view.translatesAutoresizingMaskIntoConstraints = false
            menuController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            menuController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            menuController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            menuController.view.trailingAnchor.constraint(equalTo: centerController.view.leadingAnchor).isActive = true
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("did add menuController")
        }
    }
    
    func configureDimmedView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissDimmedScreen))
        dimmedView.addGestureRecognizer(tapGesture)
        dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        dimmedView.alpha = 0
        view.addSubview(dimmedView)
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        dimmedView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        dimmedView.leadingAnchor.constraint(equalTo: menuController.view.trailingAnchor).isActive = true
        dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // MARK: - Actions
    
    @objc func dismissDimmedScreen() {
            isExpanded = !isExpanded
            animatePanel(shouldExpand: isExpanded, menuOptions: nil)
    }
    
    func animateDimmedView(shouldDimm: Bool) {
        if shouldDimm {
            graphicHelper.dimmView(view: dimmedView)

        } else {
            graphicHelper.dismissDimmedView(view: dimmedView)
            
        }
    }
    
    func animatePanel(shouldExpand: Bool, menuOptions: MenuOptions?) {
        if shouldExpand {
            
            // show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.xConstraint.constant = self.centerController.view.frame.width * 0.8
            }, completion: nil)
        } else {
            // hide menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.xConstraint.constant = 0
            } completion: { (_) in
                guard let menuOption = menuOptions else {return}
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        animateDimmedView(shouldDimm: shouldExpand)
        animateStatusBar()
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
    
    func didSelectMenuOption(menuOption: MenuOptions) {
        switch menuOption{
        
        case .Home: break
        case .MyRecipes:
            let controller = RecipeBookController(nibName: "RecipeBookController", bundle: nil)
            let navController = UINavigationController(rootViewController:controller)
            navController.modalPresentationStyle = .fullScreen
            present(navController, animated: true, completion: nil)
        case .Chat:
            let controller = ChatController()
            let navController = UINavigationController(rootViewController:controller)
            navController.modalPresentationStyle = .fullScreen
            present(navController, animated: true, completion: nil)
        case .Calendar:
            let controller = CalendarController(nibName: "CalendarController", bundle: nil)
            let navController = UINavigationController(rootViewController:controller)
            navController.modalPresentationStyle = .fullScreen
            present(navController, animated: true, completion: nil)
        case .Profile:
            let controller = ProfileController(nibName: "ProfileController", bundle: nil)
            let navController = UINavigationController(rootViewController:controller)
            navController.modalPresentationStyle = .fullScreen
            present(navController, animated: true, completion: nil)
        case .Settings:
            let controller = SettingsController(nibName: "SettingsController", bundle: nil)
            let navController = UINavigationController(rootViewController:controller)
            navController.modalPresentationStyle = .fullScreen
            present(navController, animated: true, completion: nil)
        case .Logout:
            UserDefaultsHelper.manager.setIsLoggedIn(bool: false)
            delegate?.finishLoggingOut()
        }
    }
}

// MARK: - Protocols

extension ContainerController: HomeControllerDelegate {
    
    func slideOutMenuToggled(ForMenuOption: MenuOptions?) {
        if !isExpanded {
            configureMenuController()
        }
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOptions: ForMenuOption)
    }
}
