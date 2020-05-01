//
//  NetworkHelper.swift
//  Delicace
//
//  Created by C4Q on 4/30/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import Foundation

class NetworkHelper {
    private init() {}
    static let manager = NetworkHelper()
    let urlSession = URLSession(configuration: .default)
    func performDataTask(with urlRequest: URL, completionHandler: @escaping ((Data) -> Void), errorHandler: @escaping (AppError) -> Void) {
        self.urlSession.dataTask(with: urlRequest){(data: Data?, response: URLResponse?, error: Error?)
            in
            DispatchQueue.main.async {
                guard let data = data else {
                    errorHandler(.noDataReceived)
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    if let _ = error {
                        errorHandler(.badStatusCode)
                    }
                    return
                }
                if let error = error {
                    let error = error as NSError
                    if error.domain == NSURLErrorDomain && error.code == NSURLErrorNotConnectedToInternet {
                        errorHandler(AppError.noConnection)
                        return
                    } else {
                        errorHandler(AppError.unKnown(rawError: error))
                        return
                    }
                }
                
                completionHandler(data)
            }
            }.resume()
    }
}
