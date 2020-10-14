//
//  MenuController.swift
//  Delicace
//
//  Created by C4Q on 3/26/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    
    // MARK: - Properties
    var selectedSection = 0
    var delegate: HomeControllerDelegate?
    
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .clear
        tv.isScrollEnabled = false
        tv.separatorColor = .clear
        return tv
    }()
    
    lazy var profileImage: UIImageView = {
        let imgV = UIImageView()
        imgV.frame = CGRect(x:0, y: 0, width: self.view.frame.width*0.4, height: self.view.frame.width*0.4)
        imgV.backgroundColor = .black
        imgV.image = #imageLiteral(resourceName: "Background")
        imgV.contentMode = .scaleAspectFill
        imgV.layer.cornerRadius = imgV.frame.height/2
        imgV.layer.borderWidth = 4
        imgV.layer.borderColor = UIColor.myRed.cgColor
        imgV.clipsToBounds = true
        return imgV
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupProfile()
        setupTableView()
        view.backgroundColor = UIColor.clear
    }
    
    // MARK: - Private
    func setupProfile(){
        view.addSubview(profileImage)
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        profileImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        profileImage.heightAnchor.constraint(equalTo: profileImage.widthAnchor).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 50).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
        tableView.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor).isActive = true
    }
    
}

// MARK: - TableViewDelegate
extension MenuController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuOption = MenuOptions(rawValue: indexPath.section) else {return}
        
        //        selectedSection = indexPath.section
        delegate?.slideOutMenuToggled(ForMenuOption: menuOption)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
}
// MARK: - TableViewDataSource
extension MenuController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let cellCount = MenuOptions.allCases.count
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        
        guard let menuOption = MenuOptions(rawValue: indexPath.section) else {return UITableViewCell()}
        cell.textLabel?.text = menuOption.description
        if indexPath.section  == selectedSection {
            cell.imageView?.image = menuOption.darkImage
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            cell.textLabel?.textColor = .myRed
            
        } else {
            cell.imageView?.image = menuOption.lightImage
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            cell.textLabel?.textColor = .myPink
        }
        return cell
    }
}
