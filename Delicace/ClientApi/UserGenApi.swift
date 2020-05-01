//
//  UserApi.swift
//  Delicace
//
//  Created by C4Q on 4/30/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import Foundation
import UIKit

struct UserGenApi {
    private init() {}
    static let manager = UserGenApi()
    func fetchMessages(url: String,
                    completionHandler: @escaping ([UserProfile]) -> Void,
                    errorHandler: @escaping (AppError) -> Void) {
        
        guard let url = URL(string: url) else {return}
        let parseData = {(data: Data) in
            do {
                let onlineInfo = try JSONDecoder().decode(onlineData.self, from: data)
//                print(onlineInfo.results[0].cell)
                completionHandler(onlineInfo.results)
            }
            catch let error {
                errorHandler(AppError.couldNotParseJSON(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: parseData, errorHandler: errorHandler)
    }
    
    
    //MARK:  ImageApi
    func getAvatarPic(urlString: String,
                    completionHandler: @escaping (UIImage) -> Void,
                    errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlString) else {return}
        let parseDataImage = {(data: Data) in
            do {
                    let url = URL(string: urlString)
                    if let imgCache = NSCacheHelper.manager.getImage(with: urlString) {
                        completionHandler(imgCache)
                        return
                    }
                    let dataImg = try Data.init(contentsOf: url!)
                    if let myImage = UIImage(data: dataImg) {
                        NSCacheHelper.manager.addImage(with: urlString, and: myImage)
                        completionHandler(myImage)
                    }
            }
            catch let error {
                errorHandler(AppError.couldNotParseJSON(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: parseDataImage, errorHandler: errorHandler)
    }
}
