//
//  ClientAPI.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/18/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import Foundation
import UIKit

struct RecipeSearchAPI {
    private init() {}
    static let manager = RecipeSearchAPI()
    private let keyAPI = "4db378cd34bb4046867b13443d9b9dbe"
    private let urlStrings = "https://api.spoonacular.com/recipes/complexSearch?apiKey=4db378cd34bb4046867b13443d9b9dbe&query=steak&addRecipeInformation=true"
    
    func fetchRecipes(url: String,
                    completionHandler: @escaping (RecipeSearch) -> Void,
                    errorHandler: @escaping (AppError) -> Void) {
        
        let urlString = urlStrings
        guard let url = URL(string: urlString) else {return}
        let parseData = {(data: Data) in
            do {
                let onlineInfo = try JSONDecoder().decode(RecipeSearch.self, from: data)
                
               print(onlineInfo.results[0].title)
                completionHandler(onlineInfo)
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
