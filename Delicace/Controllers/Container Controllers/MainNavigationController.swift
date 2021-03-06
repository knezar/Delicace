//
//  MainNavigationController.swift
//  Delicace
//
//  Created by C4Q on 3/23/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        if isLoggedIn() {
            finishLoggingIn()
        } else {
            finishLoggingOut()
        }
    }
    
    fileprivate func isLoggedIn() -> Bool{
        return UserDefaultsHelper.manager.isLoggedIn()
    }
}

extension MainNavigationController: LoginControllerDelegate{
    
    func finishLoggingIn() {
        let containerController = ContainerController()
        containerController.delegate = self
        setViewControllers([containerController], animated: true)
    }
    
    func finishLoggingOut() {
        let loginController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        loginController.delegate = self
        setViewControllers([loginController], animated: true)
    }
    
}
