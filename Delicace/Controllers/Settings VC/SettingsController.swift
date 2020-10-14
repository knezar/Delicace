//
//  SettingsController.swift
//  Delicace
//
//  Created by Nezar Khabar on 10/14/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    // MARK: - Properties

    // MARK: - Outlets
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigUI()
    }
    
    // MARK: - Private
    func ConfigUI() {
        view.backgroundColor = .yellow
        navigationItem.title = "Settings"
        navigationController?.navigationBar.barStyle = .black
        navigationItem.leftBarButtonItem = navButtonConfiguration(image: #imageLiteral(resourceName: "Logout"), selector:  #selector(cancelButtonToggeled))
        
        
    }
    func navButtonConfiguration(image: UIImage, selector: Selector) -> UIBarButtonItem {
        let barButton = UIBarButtonItem(image: image.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: selector)
        return barButton
    }
    
    // MARK: - Actions
    
    @objc func cancelButtonToggeled(){
        self.dismiss(animated: true, completion: nil)
    }

}
