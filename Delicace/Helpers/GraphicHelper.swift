//
//  GraphicHelper.swift
//  Delicace
//
//  Created by C4Q on 3/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class GraphicHelper: NSObject {

    override init(){
        super.init()
    }
    
    func dimmView(view: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            view.alpha = 1
        })
    }
    func dismissDimmedView(view: UIView) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
           view.alpha = 0
        })
    }
    func animateButtonTransform(rotateView: UIView, transformBy: CGAffineTransform, expandView: UIView, expandBy: CGAffineTransform, showView: UIView, alpha: CGFloat ) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            showView.alpha = alpha
            expandView.transform = expandBy
            rotateView.transform = transformBy
        }, completion: nil)
    }
    
    func getGradientImage(bounds: CGRect) -> UIImage? {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.myPink.cgColor, UIColor.myRed.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        var gradientImage: UIImage?
        UIGraphicsBeginImageContext(gradient.bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradient.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
}
