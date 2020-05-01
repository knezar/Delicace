//
//  UserModel.swift
//  Delicace
//
//  Created by C4Q on 4/30/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import Foundation


//"gender": "female",
//"name": {"title": "Miss", "first": "Clarissa", "last": "Bröcker"},
//"location": {
//    "street": {"number": 9217, "name": "Lindenweg"},
//    "city": "Gaggenau",
//    "state": "Berlin",
//    "country": "Germany",
//    "postcode": 79564,
//    "coordinates": {"latitude": "-38.4964","longitude": "172.7562"},
//},
//"email": "clarissa.brocker@example.com",
//"login": {"uuid": "213be942-cf2c-4304-85df-c14a8ab50918","username": "yellowpeacock175","password": "stan", "salt": "8jWmcrFw",},
//"dob": {"date": "1960-11-07T10:31:55.490Z","age": 60},
//"phone": "0673-0515684",
//"cell": "0175-1120866",
//"picture": {
//    "large": "https://randomuser.me/api/portraits/women/54.jpg",
//    "medium": "https://randomuser.me/api/portraits/med/women/54.jpg",
//    "thumbnail": "https://randomuser.me/api/portraits/thumb/women/54.jpg"
//},
//"nat": "DE"

struct onlineData: Codable{
    var results: [UserProfile]
}

struct UserProfile: Codable {
    var gender: String
    var name: Name
    var location: Location
    var email: String
    var login: Login
    var dob: DOB
    var phone: String
    var cell: String
    var picture: Picture
}

struct Name: Codable{
    var first: String
    var last: String
}
struct Picture: Codable {
    var large: String
    var medium: String
    var thumbnail: String
}
struct DOB: Codable {
    var date: String
    var age: Int
}
struct Login: Codable {
    var uuid: String
    var username: String
    var password: String
}

struct Location: Codable {
    var street: Street
    var city: String
    var state: String
    var country: String
//    var postcode: Int
    var coordinates: Coordinates
}
struct Coordinates: Codable {
    var latitude: String
    var longitude: String
}
struct Street: Codable {
    var number: Int
    var name: String
}
