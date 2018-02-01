//
//  ViewController.swift
//  trenddit
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController, AuthDelegate {

    let loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        FirebaseApp.configure()
        view.addSubview(loginView)
        loginView.emailTextfield.delegate = self
        loginView.passwordTextfield.delegate = self
        loginView.logInButton.delegate = self
        loginView.signUpButton.delegate = self
        loginView.callToActionView.callToActionButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    }
    
    @objc func signUp() {
         present(SignUpVC(), animated: true, completion: nil)
    }
    
    func logIn() {
        //
    }

}

extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
