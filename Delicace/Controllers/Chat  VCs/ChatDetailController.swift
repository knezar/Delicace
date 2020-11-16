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
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomGradient: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    // MARK: - Properties
    let leftCellID = "leftCell"
    let rightCellID = "rightCell"
    let graphicHelper = GraphicHelper()
    
    var textfieldinput = ""
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        configureBottomGradient()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Private
    func configureBottomGradient() {
        guard let image = graphicHelper.getGradientImage(bounds: bottomGradient.bounds) else {return}
        
        bottomGradient.image = image
        
        
    }
    
    private func configureTable() {
        tableView.register(LeftChatCell.self, forCellReuseIdentifier: leftCellID)
        tableView.register(RightChatCell.self, forCellReuseIdentifier: rightCellID)
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        
    }
    
// MARK: - Actions
    @IBAction func SendButtonToggled(_ sender: UIButton) {
        
        print(textfieldinput)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        scrollView.isScrollEnabled = true

      guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
      else {
        // if keyboard size is not available for some reason, dont do anything
        return
      }

      let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height , right: 0.0)
      scrollView.contentInset = contentInsets
//        scrollView.isScrollEnabled = true

    }

    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.isScrollEnabled = false
      let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
          
      
      // reset back the content inset to zero after keyboard is gone
      scrollView.contentInset = contentInsets
//      scrollView.scrollIndicatorInsets = contentInsets
    }
}

    //MARK: - TextFieldDelegate

extension ChatDetailController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        textField.resignFirstResponder()
        print(textField.text!)
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.becomeFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else {return}
        textfieldinput = text
        
//        textField.resignFirstResponder()
    }
    
    
}
    // MARK: - TableViewDelegate

extension ChatDetailController: UITableViewDelegate {
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return UITableView.automaticDimension
    //    }
}

//  MARK: - TableViewDataSource

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
        
        
        return myCell
    }
    
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
    
}
