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

   
    
    func getGradientImage(bounds: CGRect) -> UIImage? {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.myPink.cgColor, UIColor.myRed.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        var gradientImage:UIImage?
        UIGraphicsBeginImageContext(gradient.bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradient.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return gradientImage
    }
    
    func setGradient (view: UIView) -> CAGradientLayer {
         let gradient = CAGradientLayer()
        gradient.frame = view.frame
        gradient.colors = [UIColor.green.cgColor, UIColor.red.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        return gradient
//        gradient.locations = [0.0, 1.0]
//        view.layer.addSublayer(gradient)  
//        view.layer.insertSublayer(gradient, at: 0)
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
