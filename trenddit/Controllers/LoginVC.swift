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
        if let (email, password) = validSignUpText(view: loginView) {
            authClient.signIn(withEmail: email, password: password)
        }
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
    
    private func validSignUpText(view: LoginView) -> (emailText: String, passwordText: String)? {
        guard let email = view.emailTextfield.text else { print("Email is nil"); return nil }
        guard !email.isEmpty else { print("email Empty"); return nil}
        guard let password = view.passwordTextfield.text else { print("Password is nil"); return nil}
        guard !password.isEmpty else { print("pass Empty"); return nil}
        return (email, password)
    }
}

// MARK: - AuthDelegate
extension LoginVC: AuthDelegate {
    func failedSignIn(error: Error) {
        handle(error: error)
    }

    func didSignIn(user: User) {
        present(CustomTabBarVC(), animated: true, completion: nil)
        print("\(user.email?.description): signed in.")
    }

}

// MARK: - UITextFieldDelegate
extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
