//
//  CustomNavigationController.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/23/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    let graphicHelper = GraphicHelper()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarAppearance()
    }
    
    private func setupNavBarAppearance() {
        
        let navigationBarAppearace = UINavigationBar.appearance()
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.white,
                     NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .regular)]
        navigationBarAppearace.titleTextAttributes = attrs
//        navigationBarAppearace.tintColor = UIColor.mainBlue
        
//        navigationBarAppearace.barTintColor = .mainBlue
//        navigationBarAppearace.setBackgroundImage(UIImage(), for: .default)
//        navigationBarAppearace.shadowImage = UIImage()
        navigationBarAppearace.isTranslucent = false
        navigationBarAppearace.barStyle = .black
        let bounds = self.navigationBar.frame
        if let image = graphicHelper.getGradientImage(bounds: bounds) {
            navigationBarAppearace.setBackgroundImage(image, for: .default)
        }
    }

}
