//
//  SettingsController.swift
//  Delicace
//
//  Created by Nezar Khabar on 10/14/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    
    // MARK: - Properties
    let graphicHelper = GraphicHelper()
    let settingsCellID = "SettingsCell"
    // MARK: - Outlets
    
    @IBOutlet weak var settingsTableView: UITableView!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        

        ConfigUI()
        configureTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        ConfigUI()
        configureTableView()
    }
    // MARK: - Private
    private func  configureTableView() {
        settingsTableView.register(SettingsCell.self, forCellReuseIdentifier: settingsCellID)
        settingsTableView.tableFooterView = UIView()
        settingsTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        
        
    }
    private func ConfigUI() {
        view.backgroundColor = .yellow
        navigationItem.title = "Settings"
        
        navigationItem.leftBarButtonItem = navButtonConfiguration(image: #imageLiteral(resourceName: "Cancel"), selector:  #selector(cancelButtonToggeled))
    }
    private func navButtonConfiguration(image: UIImage, selector: Selector) -> UIBarButtonItem {
        let barButton = UIBarButtonItem(image: image.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: selector)
        return barButton
    }
    
    // MARK: - Actions
    
    @objc func cancelButtonToggeled(){
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

    // MARK: - TableView Datasource
extension SettingsController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = SettingsOptions(rawValue: section) else {return 0}
        switch section {
        case .Social: return SocialOptions.allCases.count
        case .Communication: return  CommunicationOptions.allCases.count
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .myPink
        let title = UILabel()
        title.textColor = .white
        title.font = .boldSystemFont(ofSize: 16)
        title.text = SettingsOptions(rawValue: section)?.description
        view.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        return view
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: settingsCellID, for: indexPath) as? SettingsCell else {return UITableViewCell()}
        guard let section = SettingsOptions(rawValue: indexPath.section) else {return UITableViewCell()}
        switch section {
        
        case .Social:
            let social = SocialOptions(rawValue: indexPath.row)
            cell.sectionType = social
        case .Communication:
            let communication = CommunicationOptions(rawValue: indexPath.row)
            cell.sectionType = communication
        }
        
        
        return cell
    }
}


    // MARK: - TableView Delegate
extension SettingsController: UITableViewDelegate {
    
}
