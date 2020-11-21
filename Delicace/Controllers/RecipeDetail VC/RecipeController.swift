//
//  DetailController.swift
//  Delicace
//
//  Created by C4Q on 3/31/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class RecipeController: UIViewController {
    
    // MARK: - Properties
    
    var x: Int? = nil
    
    // MARK: - Outlets
    
    @IBOutlet weak var inProgress: UILabel!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let x = x else {return}
        
        inProgress.text = "in progress, you pressed cell N \(x)"
    }
    
    // MARK: - Private

    
    // MARK: - Actions
    


}
