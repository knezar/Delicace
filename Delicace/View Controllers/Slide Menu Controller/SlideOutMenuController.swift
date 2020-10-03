//
//  MenuController.swift
//  Delicace
//
//  Created by C4Q on 3/26/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class SlideMenuController: UIViewController {
    
    // MARK: - Properties
    var selectedSection = 0
    let cellOptions = ["Recipes", "Feed", "Chat", "Favorite", "Profile", "Settings", "Logout"]
    var delegate: LoginControllerDelegate?
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .clear
        tv.isScrollEnabled = false
        tv.separatorColor = .clear
        return tv
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        view.backgroundColor = UIColor.myLightPink
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.width*0.6).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width*0.6).isActive = true
    }

}

// MARK: - TableViewDelegate
extension SlideMenuController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == cellOptions.count-1 {
                UserDefaultsHelper.manager.setIsLoggedIn(bool: false)
                delegate?.finishLoggingOut()
            }
        selectedSection = indexPath.section
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          return 10
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
}
// MARK: - TableViewDataSource
extension SlideMenuController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
           return cellOptions.count
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.textLabel?.text = cellOptions[indexPath.section]
        
        if indexPath.section  == selectedSection {
            cell.imageView?.image = UIImage(named: cellOptions[indexPath.section]+"-h")
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            cell.textLabel?.textColor = .myRed

        } else {
            cell.imageView?.image = UIImage(named: cellOptions[indexPath.section])
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            cell.textLabel?.textColor = .myPink
        }
        return cell
    }
}
