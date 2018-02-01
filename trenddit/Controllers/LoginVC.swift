//
//  ViewController.swift
//  trenddit
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {
    
    // MARK: - Setup - View/Data
    let authClient = AuthClient()
    let loginView = LoginView()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(loginView)
        setDelegates()
        setButtonActions()
    }
    
    // MARK: - User Actions
    @objc func signUpPressed() {
         present(SignUpVC(), animated: true, completion: nil)
    }
    
    @objc func logInPressed() {
        authClient.signIn(withEmail: loginView.emailTextfield.text!, password: loginView.passwordTextfield.text!)
    }

}

// MARK: - Private Methods
private extension LoginVC {
    func setDelegates() {
        loginView.emailTextfield.delegate = self
        loginView.passwordTextfield.delegate = self
        authClient.delegate = self
    }
    
    func setButtonActions() {
        loginView.logInButton.addTarget(self, action: #selector(logInPressed), for: .touchUpInside)
        loginView.callToActionView.callToActionButton.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
    }
}

// MARK: - AuthDelegate
extension LoginVC: AuthDelegate {
    func signUp() {
        //
    }
    
    func logIn() {
        //
    }
    
    func didSignIn() {
        //
    }
    
}

// MARK: - UITextFieldDelegate
extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
