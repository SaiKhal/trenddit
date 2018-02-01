//
//  SignUpVC.swift
//  trenddit
//
//  Created by Masai Young on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import FirebaseAuth

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
        self.modalTransitionStyle = .flipHorizontal
        self.modalPresentationStyle = .overCurrentContext
    }

    // MARK: - User Actions
    @objc func dismissPressed() {
        dismiss(animated: true, completion: nil)
    }

    @objc func signUpPressed() {
        if let (email, password) = validSignUpText(view: signUpView) {
            authClient.createUser(withEmail: email, password: password)
        }
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
    
    private func validSignUpText(view: SignUpView) -> (emailText: String, passwordText: String)? {
        guard let email = view.emailTextfield.text else { print("Email is nil"); return nil }
        guard !email.isEmpty else { print("email Empty"); return nil}
        guard let password = view.passwordTextfield.text else { print("Password is nil"); return nil}
        guard !password.isEmpty else { print("pass Empty"); return nil}
        return (email, password)
    }
}

// MARK: - AuthDelegate
extension SignUpVC: AuthDelegate {
    func failedCreateUser(error: Error) {
        handle(error: error)
    }
    
    func didCreateUser(user: User) {
        print("\(user.email?.description): Created")
    }

}

// MARK: - UITextFieldDelegate
extension SignUpVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
