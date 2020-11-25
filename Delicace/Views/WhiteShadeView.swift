//
//  WhiteShadeView.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class WhiteShadeView: UIView {
    
    //initWithFrame to init view from code
//        override init(frame: CGRect) {
//          super.init(frame: frame)
//    //      setupView()
//        }
    
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
        //        self.alpha = 0.4
        
        let GradientLayerName = "gradientLayer"
        if let oldlayer = self.layer.sublayers?.filter({$0.name == GradientLayerName}).first {
            oldlayer.removeFromSuperlayer()
        }
        
        //
        let firstColor = UIColor.clear
        let secondColor = UIColor.white.withAlphaComponent(0.99)
        
        
        let gradientLayer = CAGradientLayer()
                gradientLayer.type = .radial
        //        let firstColor = UIColor.myRed.withAlphaComponent(0.3)
        //        let secondColor = UIColor.myRed.withAlphaComponent(0.8)
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 1, y:0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0.99)
        gradientLayer.locations = [0.5, 1]
        gradientLayer.frame = self.bounds
        gradientLayer.name = GradientLayerName
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}

