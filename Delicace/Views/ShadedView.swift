//
//  ShadedView.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/16/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class ShadedView: UIView {
    

    
    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    //    override func layoutSubviews() {
    //        setupView()
    //    }
    override func layoutSublayers(of layer: CALayer) {
        setupView()
        
    }
    //common func to init our view
    private func setupView() {
        let GradientLayerName = "gradientLayer"
        if let oldlayer = self.layer.sublayers?.filter({$0.name == GradientLayerName}).first {
            oldlayer.removeFromSuperlayer()
        }
        
        //
//                let firstColor = UIColor.black
//                let secondColor = UIColor.myRed
        
        let gradientLayer = CAGradientLayer()
//        gradientLayer.type = .radial
        let firstColor = UIColor.clear
        let secondColor = UIColor.myRed.withAlphaComponent(0.95)
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0, y:0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = self.bounds
        gradientLayer.name = GradientLayerName
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
