//
//  TestDataModel.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/23/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit


//   let imageItems = ["Rec-1", "Rec-2", "Rec-3", "Rec-4", "Rec-5"]
//let titleItems = ["Chermoula couscous", "Flaky chicken and almond pie", "Chermoula eggplant", "Garam masala bastilla", "Goat tagine with almonds"]

enum RecipeTestDataModel: Int, CaseIterable, CustomStringConvertible {
    
    case FirstRecipe
    case SecondRecipe
    case ThirdRecipe
    case ForthRecipe
    case FifthRecipe
    
    var description: String {
        switch self {
            
        case .FirstRecipe: return "Chermoula couscous"
        case .SecondRecipe: return "Flaky chicken and almond pie"
        case .ThirdRecipe: return "Chermoula eggplant"
        case .ForthRecipe: return "Garam masala bastilla"
        case .FifthRecipe: return "Goat tagine with almonds"
        }
    }
    
    var summary: String {
        switch self {
        
        case .FirstRecipe: return "Mi bibendum neque egestas congue quisque. Venenatis urna cursus eget nunc scelerisque viverra. Quis imperdiet massa tincidunt nunc pulvinar sapien et. Augue neque gravida in fermentum et sollicitudin. Commodo quis imperdiet massa tincidunt. Mauris vitae ultricies leo integer malesuada nunc vel risus."
        case .SecondRecipe: return "Elementum tempus egestas sed sed risus pretium quam vulputate. Eu ultrices vitae auctor eu. Nec tincidunt praesent semper feugiat nibh sed. Enim ut sem viverra aliquet eget sit amet tellus cras. Id eu nisl nunc mi ipsum faucibus vitae aliquet nec."
        case .ThirdRecipe: return "Massa massa ultricies mi quis. Venenatis cras sed felis eget velit aliquet sagittis id. Turpis egestas pretium aenean pharetra magna ac placerat. Tincidunt dui ut ornare lectus sit amet est placerat. Porta lorem mollis aliquam ut porttitor leo. Nam aliquam sem et tortor consequat id."
        case .ForthRecipe: return "Amet volutpat consequat mauris nunc congue nisi vitae suscipit. Rhoncus aenean vel elit scelerisque mauris pellentesque pulvinar. Sit amet nulla facilisi morbi tempus iaculis. Vel pretium lectus quam id leo"
        case .FifthRecipe: return " Sit amet nulla facilisi morbi tempus iaculis. Vel pretium lectus quam id leo. Convallis posuere morbi leo urna molestie at. Vestibulum morbi blandit cursus risus at. Id semper risus in hendrerit gravida. Blandit aliquam etiam erat velit scelerisque"
        }
    }
    
    var recipeImage: String {
        switch self {
        case .FirstRecipe: return "Rec-1"
        case .SecondRecipe: return "Rec-2"
        case .ThirdRecipe: return "Rec-3"
        case .ForthRecipe: return "Rec-4"
        case .FifthRecipe: return "Rec-5"
        }
    }
    
    var time: Int {
        switch self {
        case .FirstRecipe: return 45
        case .SecondRecipe: return 65
        case .ThirdRecipe: return 30
        case .ForthRecipe: return 60
        case .FifthRecipe: return 75
        }
    }
    
    var servings: Int {
        switch self {
        case .FirstRecipe: return 2
        case .SecondRecipe: return 5
        case .ThirdRecipe: return 4
        case .ForthRecipe: return 1
        case .FifthRecipe: return 8
        }
    }
    
    var likes: Int {
        switch self {
        case .FirstRecipe: return 300
        case .SecondRecipe: return 1287
        case .ThirdRecipe: return 45
        case .ForthRecipe: return 5678
        case .FifthRecipe: return 725
        }
    }
    
    var id: Int {
        switch self {
        case .FirstRecipe: return 300
        case .SecondRecipe: return 1287
        case .ThirdRecipe: return 45
        case .ForthRecipe: return 5678
        case .FifthRecipe: return 725
        }
    }
}


//classe RecipeTsetData
