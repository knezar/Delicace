//
//  SettingsCell.swift
//  Delicace
//
//  Created by Nezar Khabar on 11/27/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    //MARK: - Properties
    
    var sectionType: SectionType? {
        didSet{
            guard let sectionType = sectionType else {return}
            textLabel?.text = sectionType.description
            switchControll.isHidden = !sectionType.ContainsSwitch
        }
    }
    lazy var switchControll: UISwitch = {
        let sc = UISwitch()
        sc.isOn = true
        sc.isUserInteractionEnabled = true
        sc.onTintColor = .myPink
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.addTarget(self, action: #selector(handleSwitchAction(_:)), for: .valueChanged)
        return sc
    }()
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Private
    
    func configureUI() {
        addSubview(switchControll)
        switchControll.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        switchControll.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        
        contentView.isUserInteractionEnabled = false
        
    }
    
    //MARK: - Actions
    
    @objc func handleSwitchAction(_ sender: UISwitch) {
        if sender.isOn {
            print("is on")
        } else {
            print("is off" )
        }
    }
    
}
