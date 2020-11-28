//
//  SettingsSection.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/27/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

enum SettingsOptions: Int, CaseIterable, CustomStringConvertible {
    case Social
    case Communication
    
    var description: String{
        switch self {
        case .Social: return "Social"
        case .Communication: return "Communication"
        }
    }
}

enum SocialOptions: Int, CaseIterable, SectionType {
    
    var ContainsSwitch: Bool {return false}
    
    case EditName
    case EditPicture
    
    var description: String {
        switch self {
        case .EditName: return "Edit Name"
        case .EditPicture: return "Edit Picture"
        }
    }
}

enum CommunicationOptions: Int, CaseIterable, SectionType {

    
    case Email
    case Notifications
    case reportCrashes
    
    
    var description: String {
        switch self {
        case .Email: return "Email"
        case .Notifications: return "Notifications"
        case .reportCrashes: return "Report Crashes"
        }
    }
    
    
    var ContainsSwitch: Bool {
        switch self {
        case .Email: return true
        case .Notifications: return false
        case .reportCrashes: return true
        }
    }
}
