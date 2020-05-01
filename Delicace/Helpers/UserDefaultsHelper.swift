//
//  UserDefaultsHelper.swift
//  Delicace
//
//  Created by C4Q on 3/26/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//


import Foundation
class UserDefaultsHelper {
    private init() {}
    static let manager = UserDefaultsHelper()
    private let loggedInKey = "isLoggedIn"
    private let defaults = UserDefaults.standard
    func setIsLoggedIn(bool: Bool) {
        defaults.set(bool, forKey: loggedInKey)
        defaults.synchronize()
    }
    func isLoggedIn() -> Bool {
        return defaults.bool(forKey: loggedInKey)
    }
}
