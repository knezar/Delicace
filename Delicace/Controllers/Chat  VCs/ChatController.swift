//
//  ChatController.swift
//  Delicace
//
//  Created by Nezar Khabar on 10/13/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class ChatController: UITableViewController {
    
    // MARK: - Properties
    let graphicHelper = GraphicHelper()
    let chatCellID = "ChatTableCell"

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ConfigUI()
        configureTable()
        
    }
    
    // MARK: - Private
    func ConfigUI() {
        navigationItem.title = "Chat"
        navigationController?.navigationBar.barStyle = .black
        navigationItem.leftBarButtonItem = navButtonConfiguration(image: #imageLiteral(resourceName: "Cancel"), selector:  #selector(cancelButtonToggeled))
        navigationItem.rightBarButtonItem = navButtonConfiguration(image: #imageLiteral(resourceName: "Compose"), selector:  #selector(addButtonToggeled))
        
    }
    func navButtonConfiguration(image: UIImage, selector: Selector) -> UIBarButtonItem {
        let barButton = UIBarButtonItem(image: image.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: selector)
        return barButton
    }
    
    private func configureTable() {
        tableView.register(UINib(nibName: "ChatTableCell", bundle: nil), forCellReuseIdentifier: chatCellID)
        tableView.backgroundColor = .white
        tableView.separatorInset.left = 0
        
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    
    // MARK: - Actions
    
    @objc func cancelButtonToggeled(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func addButtonToggeled(){
    print("yaaaay")
        
    }
    
    //MARK: - TableView Delegate

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 75
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailChatController = ChatDetailController(nibName: "ChatDetailController", bundle: nil)
        
        navigationController?.pushViewController(detailChatController, animated: true)
        print("this cell number: \(indexPath.row)")
    }
    
    // MARK: - Tableview Datasource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: chatCellID, for: indexPath) as? ChatTableCell else {return UITableViewCell()}

        // Configure the cell...
        cell.selectionStyle = .none
//        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

