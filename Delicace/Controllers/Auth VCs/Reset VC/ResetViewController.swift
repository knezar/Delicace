//
//  ResetViewController.swift
//  Delicace
//
//  Created by C4Q on 3/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class ResetViewController: UIViewController {
    // MARK: - Properties
    let graphicHelper = GraphicHelper()

    // MARK: - Outlets
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
        configureResetButton()
    }
    
    // MARK: - Private
    private func configureResetButton() {
        resetButton.setCornerRadius(cornerR: resetButton.frame.height / 2)
        resetButton.clipsToBounds = true
        let image = graphicHelper.getGradientImage(bounds: resetButton.bounds)
        resetButton.setBackgroundImage(image, for: .normal)
    }
    func configureTextFields() {
        emailTextField.delegate = self
        setupTextFieldPalceHolder(textField: emailTextField, text: "Email")
         self.navigationController?.setNavigationBarHidden(true, animated: true)
     }
    func setupTextFieldPalceHolder(textField: UITextField, text: String) {
        let attrs =  [
            NSAttributedString.Key.foregroundColor: UIColor.myPink,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: attrs)
    }
    
    // MARK: - Actions
    @IBAction func didPressReset(_ sender: UIButton) {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}

extension ResetViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
