//
//  ErrorHelper.swift
//  Delicace
//
//  Created by C4Q on 4/30/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import Foundation

enum AppError: Error {
    case noDataReceived
    case noConnection
    case badStatusCode
    case unKnown(rawError: Error)
    case couldNotParseJSON(rawError: Error)
}
