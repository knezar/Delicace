//
//  LoginViewController.swift
//  Delicace
//
//  Created by C4Q on 3/19/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    let graphicHelper = GraphicHelper()
    var delegate: LoginControllerDelegate?
//    var handle: AuthStateDidChangeListenerHandle?
    
    // MARK: - Outlets
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
//            // ...
//        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTextFields()
        configureSignInButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    // MARK: - Private
    private func configureSignInButton() {
        signinButton.layer.cornerRadius = signinButton.frame.height / 2
        signinButton.clipsToBounds = true
        let image = graphicHelper.getGradientImage(bounds: signinButton.bounds)
        signinButton.setBackgroundImage(image, for: .normal)
    }
    private func configureTextFields() {
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        setupTextFieldPalceHolder(textField: userNameTextField, text: "Email")
        setupTextFieldPalceHolder(textField: passwordTextField, text: "Password")
    }
    
    private func setupTextFieldPalceHolder(textField: UITextField, text: String) {
        let attrs =  [
            NSAttributedString.Key.foregroundColor: UIColor.myPink,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: attrs)
    }
    
    // MARK: - Actions
    @IBAction func didPressLoginButton(_ sender: Any) {
        guard
            let email = userNameTextField.text,
            let password = passwordTextField.text
        else {return}
        
//        print(email, password)
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            guard let result = authResult, error == nil else {
                print("error: User Don't exist")
                return
            }
            let user = result.user
            print(user)
            self.delegate?.finishLoggingIn()
        }
        
            //            guard let strongSelf = self else { return }

            // ...
//        UserDefaultsHelper.manager.setIsLoggedIn(bool: true)
//        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didPressCreateAccount(_ sender: UIButton) {
        let signupViewController = SignupViewController()
        signupViewController.modalPresentationStyle = .fullScreen
        present(signupViewController, animated: true, completion: nil)
    }
    
    @IBAction func didPressNeedHelp(_ sender: UIButton) {
        let resetViewController = ResetViewController()
        resetViewController.modalPresentationStyle = .fullScreen
        present(resetViewController, animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
