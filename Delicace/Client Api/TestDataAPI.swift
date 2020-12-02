//
//  TestDataAPI.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/29/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import Foundation
import UIKit


struct TestDataAPI {

    private init() {}
    static let manager = TestDataAPI()
    
    
    func readLocalFile(forName name: String) -> [SearchResults]? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
//                return jsonData
                do {
                    let decodedData = try JSONDecoder().decode(RecipeSearch.self, from: jsonData)
                    decodedData.results.forEach { (result) in
                        fetchImage(urlString: result.image)
                    }
                    return decodedData.results
                } catch {
                    print("decode error")
                }
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    
    private func fetchImage(urlString: String) {
//        print("fetching image")
    
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
    
}
