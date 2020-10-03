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
    weak var loginControllerDelegate: LoginControllerDelegate?
    var menuController: UIViewController!
    var centerController: UIViewController!
    private var heightConstraint: NSLayoutConstraint!
    private var widthConstraint: NSLayoutConstraint!
    private var xConstraint: NSLayoutConstraint!
    private var yConstraint: NSLayoutConstraint!
    var isExpanded = false
    let graphicHelper = GraphicHelper()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    // MARK: - Private
    func configureHomeController() {
        let homeController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        let navigationBarAppearace = UINavigationBar.appearance()
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .regular)]
        
        navigationBarAppearace.titleTextAttributes = attrs
        navigationBarAppearace.tintColor = UIColor.white
        navigationBarAppearace.isTranslucent = false
        
        let bounds = self.navigationController!.navigationBar.frame
        if let image = graphicHelper.getGradientImage(bounds: bounds) {
            navigationBarAppearace.setBackgroundImage(image, for: .default)
        }

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
        let menuVC = SlideMenuController()
        menuVC.delegate = loginControllerDelegate
        if menuController == nil {
            menuController = menuVC
            view.insertSubview(menuController.view, at: 0)
            menuController.view.translatesAutoresizingMaskIntoConstraints = false
            menuController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            menuController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            menuController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            menuController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("did add menuController")
        }
    }
    
    // MARK: - Actions

    func showMenuController(shouldExpand: Bool) {
        if shouldExpand {
            // show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                self.centerController.view.setCornerRadius(cornerR: 12)
                self.heightConstraint.constant = -(self.centerController.view.frame.height * 0.2)
                self.widthConstraint.constant =  -(self.centerController.view.frame.width * 0.2)
                self.xConstraint.constant = self.centerController.view.frame.width - (self.centerController.view.frame.width * 0.4)

            }, completion: nil)
        } else {
            // hide menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.setCornerRadius(cornerR: 0)
                self.xConstraint.constant = 0
                self.heightConstraint.constant = 0
                self.widthConstraint.constant = 0
            }, completion: nil)
        }
    }
}

// MARK: - Protocols

extension ContainerController: HomeControllerDelegate {
    func slideOutMenuToggled() {
        if !isExpanded {
            configureMenuController()
        }
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded)
    }
}
