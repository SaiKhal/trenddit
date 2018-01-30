//
//  ViewController.swift
//  trenddit
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    let loginView = SignUpView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        FirebaseApp.configure()
        view.addSubview(loginView)
        loginView.emailTextfield.delegate = self
        loginView.passwordTextfield.delegate = self
    }

}

extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
