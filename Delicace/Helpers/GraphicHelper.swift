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

    let myView = UIView()
    func dimmScreen(view: UIView) -> UIView {
        myView.backgroundColor = UIColor(white: 0, alpha: 0.7)
        view.addSubview(myView)
        myView.frame = view.frame
            myView.alpha = 0
            UIView.animate(withDuration: 0.5) {
                self.myView.alpha = 1
            }
        return myView
    }
    
    func dismissDimmedView () {
        UIView.animate(withDuration: 0.5) {
            self.myView.alpha = 0
        }
    }
    
    func animateButtonTransform(viewToRotate: UIView, rotate: CGAffineTransform, ViewtoExpand: UIView, expand: CGAffineTransform, alpha: Int) {
        var alpha = alpha
        UIView.animate(withDuration: 1) {
            ViewtoExpand.transform = expand
            viewToRotate.transform = rotate
            alpha = 1
            //            self
        }
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
    
    func setGradient (view: UIView) -> UIView {
         let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.red.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.locations = [0.75, 1.0]

        view.layer.insertSublayer(gradient, at: 0)

        return view
//        view.layer.addSublayer(gradient)
     }
    
    
    func addShadedGradient(bounds: CGRect) -> UIView {
        let gradient = CAGradientLayer()
       gradient.frame = bounds
       gradient.colors = [UIColor.green.cgColor, UIColor.red.cgColor]
       gradient.startPoint = CGPoint(x: 0, y: 0)
       gradient.endPoint = CGPoint(x: 0, y: 1)
       gradient.locations = [0.75, 1.0]

        let view = UIView()
        view.alpha = 0.5
        

       view.layer.insertSublayer(gradient, at: 0)

        return view
    }
    
//    func addBlurTo(image: UIImage, radius: CGFloat) -> UIImage {
//        let ciContext = CIContext(options: nil)
//        guard let inputImage = CIImage(image: image) else {return image}
//        guard let gaussianBlurFilter = CIFilter(name: "CIGaussianBlur") else { return image }
//        gaussianBlurFilter.setValue(inputImage, forKey: kCIInputImageKey)
//        gaussianBlurFilter.setValue(radius, forKey: "inputRadius")
//
//        guard let blurdImage = gaussianBlurFilter.value(forKey: kCIOutputImageKey) as? CIImage else { return image }
//        guard let monochromeFilter = CIFilter(name: "CIExposureAdjust") else { return image }
//        monochromeFilter.setValue(blurdImage, forKey: kCIInputImageKey)
//        monochromeFilter.setValue(-0.5, forKey: "inputEV")
//        guard let resultImage2 = monochromeFilter.value(forKey: kCIOutputImageKey) as? CIImage else { return image }
//        guard let cgImage2 = ciContext.createCGImage(resultImage2, from: inputImage.extent) else { return image }
//        return UIImage(cgImage: cgImage2)
//    }
}
