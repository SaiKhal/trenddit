//
//  SignUpVC.swift
//  trenddit
//
//  Created by Masai Young on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    // MARK: - Setup - View/Data
    let authClient = AuthClient()
    let signUpView = SignUpView()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(signUpView)
        setDelegates()
        setButtonActions()
    }
    
    // MARK: - User Actions
    @objc func dismissPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func signUpPressed() {
        //authClient.createUser(withEmail: <#T##String#>, password: <#T##String#>)
    }

}

// MARK: - Private Methods
private extension SignUpVC {
    func setDelegates() {
        signUpView.emailTextfield.delegate = self
        signUpView.passwordTextfield.delegate = self
        authClient.delegate = self
    }
    
    func setButtonActions() {
        signUpView.dismissButton.addTarget(self, action: #selector(dismissPressed), for: .touchUpInside)
        signUpView.callToActionView.callToActionButton.addTarget(self, action: #selector(dismissPressed), for: .touchUpInside)
        signUpView.signUpButton.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
    }
}

// MARK: - AuthDelegate
extension SignUpVC: AuthDelegate {
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
extension SignUpVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

