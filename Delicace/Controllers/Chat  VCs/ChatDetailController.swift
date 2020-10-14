//
//  ChatController.swift
//  Delicace
//
//  Created by C4Q on 3/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class ChatDetailController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    
    // MARK: - Properties
    let leftCellID = "leftCell"
    let rightCellID = "rightCell"
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        
    }
    
    // MARK: - Private
    
    
    private func configureTable() {
        tableView.register(LeftChatCell.self, forCellReuseIdentifier: leftCellID)
        tableView.register(RightChatCell.self, forCellReuseIdentifier: rightCellID)
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    // MARK: - Actions
    
}


//     MARK: - TableViewDelegate

extension ChatDetailController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
}

// MARK: - TableViewDataSource

extension ChatDetailController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var myCell = UITableViewCell()
        if indexPath.row % 2 == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: rightCellID) as? RightChatCell else {return myCell}
            myCell = cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: leftCellID) as? LeftChatCell else {return myCell}
            myCell = cell
        }
        
//        myCell.textLabel?.text = "fuckkkkkk"
        
        return myCell
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    
}
