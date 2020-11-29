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
    
    func fetchRecipes(query: String,
                    completionHandler: @escaping (RecipeSearch) -> Void,
                    errorHandler: @escaping (AppError) -> Void) {
        
        let urlString = "https://api.spoonacular.com/recipes/complexSearch?apiKey=\(keyAPI)&query=\(query)&addRecipeInformation=true"
        guard let url = URL(string: urlString) else {return}
        let parseData = {(data: Data) in
            do {
                let onlineInfo = try JSONDecoder().decode(RecipeSearch.self, from: data)
                onlineInfo.results.forEach({ (result) in
                    fetchImage(urlString: result.image)
                })
                completionHandler(onlineInfo)
            }
            catch let error {
                errorHandler(AppError.couldNotParseJSON(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: url, completionHandler: parseData, errorHandler: errorHandler)
    }
    
    func fetchImage(urlString: String) {
            print("fetching image")
        
        let imageURL = URL(string: urlString)
            if let url = imageURL {
                
                let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                    guard let data = data else {
                        return
                    }
                    // maybe try dispatch to main
                    DispatchQueue.main.async {
                    guard let myImage = UIImage(data: data) else {return}
                 NSCacheHelper.manager.addImage(with: urlString, and: myImage)
                    }
                }
                task.resume()
            }
        }
    
    //MARK:  ImageApi
    func downloadPictures(urlString: String,
                    completionHandler: @escaping (UIImage) -> Void,
                    errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlString) else {return}
        let parseDataImage = {(data: Data) in
            do {
//                    let url = URL(string: urlString)
                    if let imgCache = NSCacheHelper.manager.getImage(with: urlString) {
                        completionHandler(imgCache)
                        return
                    }
                    let dataImg = try Data.init(contentsOf: url)
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
