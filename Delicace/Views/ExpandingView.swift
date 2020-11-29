//
//  ExpandingView.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/24/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class ExpandingView: UIView {
    
    
    lazy var chatAddButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Chat-h"), for: .normal)
        return button
    }()
    
    lazy var recipeAddButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Recipes-h"), for: .normal)

        
        return button
    }()
    
    lazy var eventAddButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Calendar-h"), for: .normal)
        return button
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureUI()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    override func layoutSubviews() {
        configureUI()
    }
    private func configureUI() {
        addSubview(chatAddButton)
        chatAddButton.translatesAutoresizingMaskIntoConstraints = false
        chatAddButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        chatAddButton.topAnchor.constraint(equalTo: topAnchor, constant: 2).isActive = true
        chatAddButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
        chatAddButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
        addSubview(recipeAddButton)
        recipeAddButton.translatesAutoresizingMaskIntoConstraints = false
        recipeAddButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        recipeAddButton.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        recipeAddButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
        recipeAddButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
        addSubview(eventAddButton)
        eventAddButton.translatesAutoresizingMaskIntoConstraints = false
        eventAddButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        eventAddButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        eventAddButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
        eventAddButton.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true

    }
}
