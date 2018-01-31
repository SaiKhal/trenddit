//
//  SignUpVC.swift
//  trenddit
//
//  Created by Masai Young on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController, AuthDelegate {
    
    let signUpView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        FirebaseApp.configure()
        view.addSubview(signUpView)
        signUpView.emailTextfield.delegate = self
        signUpView.passwordTextfield.delegate = self
        signUpView.logInButton.delegate = self
        signUpView.signUpButton.delegate = self
    }
    
    func signUp() {
        //
    }
    
    func logIn() {
        //
    }
    
}

extension SignUpVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

