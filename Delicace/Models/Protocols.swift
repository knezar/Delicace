//
//  Protocols.swift
//  Delicace
//
//  Created by C4Q on 3/28/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import Foundation

protocol HomeControllerDelegate: class {
    func slideOutMenuToggled(ForMenuOption: MenuOptions?)
}

protocol LoginControllerDelegate: class {
    func finishLoggingIn()
    func finishLoggingOut()
}

protocol SectionType: CustomStringConvertible {
    var ContainsSwitch: Bool {get}
}

protocol CollectionScrollDelegate: class {
    func scrollToCellAtIndex(index: Int)
}
protocol CollectionSelectionDelegate: class {
    func selectCellAtIndex(index: Int)
}
