//
//  SignupViewController.swift
//  Delicace
//
//  Created by C4Q on 3/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    // MARK: - Properties
    let graphicHelper = GraphicHelper()

    // MARK: - Outlets
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureTextFields()
        configureSignUpButton()
    }

    // MARK: - Private
        private func configureSignUpButton() {
            signupButton.setCornerRadius(cornerR: signupButton.frame.height / 2)
            signupButton.clipsToBounds = true
            let image = graphicHelper.getGradientImage(bounds: signupButton.bounds)
            signupButton.setBackgroundImage(image, for: .normal)
        }
    
       private func configureTextFields() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
//        backgroundImage.image = graphicHelper.addBlurTo(image: #imageLiteral(resourceName: "Background"), radius: 14)
//        emailTextField.attributedPlaceholder
        setupTextFieldPalceHolder(textField: emailTextField, text: "Email")
        setupTextFieldPalceHolder(textField: passwordTextField, text: "Password")
        setupTextFieldPalceHolder(textField: firstNameTextField, text: "First Name")
        setupTextFieldPalceHolder(textField: lastNameTextField, text: "Last Name")
        }
        private func setupTextFieldPalceHolder(textField: UITextField, text: String) {
            let attrs =  [
                NSAttributedString.Key.foregroundColor: UIColor.myPink,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)
            ]
            textField.attributedPlaceholder = NSAttributedString(string: text, attributes: attrs)
        }

    // MARK: - Actions

    @IBAction func didPressSignIn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didPressNeedHelp(_ sender: UIButton) {
        let resetViewController = ResetViewController()
        resetViewController.modalPresentationStyle = .fullScreen
        present(resetViewController, animated: true, completion: nil)
    }
    
    
}



extension SignupViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
