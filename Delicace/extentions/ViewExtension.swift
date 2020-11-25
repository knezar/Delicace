//
//  extentions.swift
//  Delicace
//
//  Created by C4Q on 3/19/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

//extension UIImage {
//    func blurred(image: UIImage, radius: CGFloat) -> UIImage {
//        let ciContext = CIContext(options: nil)
//        guard let cgImage = cgImage else { return self }
//        let inputImage = CIImage(cgImage: cgImage)
//        guard let gaussianBlurFilter = CIFilter(name: "CIGaussianBlur") else { return self }
//        gaussianBlurFilter.setValue(inputImage, forKey: kCIInputImageKey)
//        gaussianBlurFilter.setValue(radius, forKey: "inputRadius")
//
//        guard let blurdImage = gaussianBlurFilter.value(forKey: kCIOutputImageKey) as? CIImage else { return self }
//        guard let monochromeFilter = CIFilter(name: "CIExposureAdjust") else { return self }
//        monochromeFilter.setValue(blurdImage, forKey: kCIInputImageKey)
//        monochromeFilter.setValue(-0.5, forKey: "inputEV")
//        guard let resultImage2 = monochromeFilter.value(forKey: kCIOutputImageKey) as? CIImage else { return self }
//        guard let cgImage2 = ciContext.createCGImage(resultImage2, from: inputImage.extent) else { return self }
//        return UIImage(cgImage: cgImage2)
//    }
//}

extension UIView {
    func addGradient(with layer: CAGradientLayer, gradientFrame: CGRect? = nil, colorSet: [UIColor],
                     locations: [Double], startEndPoints: (CGPoint, CGPoint)? = nil) {
        layer.frame = gradientFrame ?? self.bounds
        layer.frame.origin = .zero
        
        let layerColorSet = colorSet.map { $0.cgColor }
        let layerLocations = locations.map { $0 as NSNumber }
        
        layer.colors = layerColorSet
        layer.locations = layerLocations
        
        if let startEndPoints = startEndPoints {
            layer.startPoint = startEndPoints.0
            layer.endPoint = startEndPoints.1
        }
        
        self.layer.insertSublayer(layer, above: self.layer)
    }
}

extension UIView {
    func setCornerRadius(cornerR: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = cornerR
    }
}

