//
//  LoginView.swift
//  trenddit
//
//  Created by Masai Young on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
import QuartzCore

class LoginView: UIView {

    lazy var emailTextfield: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .line
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.keyboardType = .emailAddress
        tf.backgroundColor = Constants.Colors.iconsOrText
        tf.layer.borderWidth = 2.0
        tf.placeholder = "Enter a email"
        return tf
    }()

    lazy var passwordTextfield: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .line
        tf.backgroundColor = Constants.Colors.iconsOrText
        tf.layer.borderWidth = 2.0
        tf.placeholder = "Enter password"
        tf.isSecureTextEntry = true
        return tf
    }()

    lazy var logInButton: UIButton = {
        let bttn = UIButton()
        bttn.backgroundColor = Constants.Colors.accent
        bttn.layer.borderWidth = 2.0
        bttn.layer.borderColor = Constants.Colors.divider.cgColor
        bttn.setTitleColor(Constants.Colors.lightPrimary, for: .normal)
        bttn.setTitle("Log In", for: .normal)
        bttn.addTarget(self, action: #selector(buttonFunc), for: .touchUpInside)
        return bttn
    }()

    @objc func buttonFunc() {
        guard let emailText = emailTextfield.text, !emailText.isEmpty else {
            //present no email error
            let animation = CABasicAnimation(keyPath: "borderColor")
            animation.fromValue = Constants.Colors.divider.cgColor
            animation.toValue = Constants.Colors.errorRed.cgColor
            animation.duration = 2.0
            let customTimingFunction = CAMediaTimingFunction(controlPoints: 0.0, 0.80, 0.0, 0.98)
            animation.timingFunction = customTimingFunction
            self.emailTextfield.layer.add(animation, forKey: animation.keyPath)
            self.emailTextfield.layer.borderColor = Constants.Colors.divider.cgColor
            return
        }

        guard let passwordText = passwordTextfield.text, !passwordText.isEmpty else {
            //present no password error
            return
        }

        print("pressed")
    }

    lazy var signUpButton: UIButton = {
        let bttn = UIButton()
        bttn.backgroundColor = Constants.Colors.accent
        bttn.layer.borderWidth = 2.0
        bttn.layer.borderColor = Constants.Colors.divider.cgColor
        bttn.setTitleColor(Constants.Colors.lightPrimary, for: .normal)
        bttn.setTitle("Sign Up", for: .normal)
        return bttn
    }()

    private func commonInit() {
        self.backgroundColor = Constants.Colors.lightPrimary
        setupTextFieldStack()
        setupTextFields()
        setupButtons()
    }

    private func setupTextFieldStack() {
        let stackview = UIStackView(arrangedSubviews: [emailTextfield, passwordTextfield])
        self.addSubview(stackview)
        stackview.alignment = .center
        stackview.axis = .vertical
        stackview.spacing = 10

        stackview.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.centerY)
            make.centerX.equalTo(self.snp.centerX)
        }
    }

    private func setupTextFields() {
        emailTextfield.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.6)
        }

        passwordTextfield.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.6)
        }
    }

    private func setupButtons() {
        self.addSubview(logInButton)
        self.addSubview(signUpButton)
        logInButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.centerY).offset(30)
            make.width.equalTo(emailTextfield.snp.width).multipliedBy(0.7)
            make.centerX.equalTo(self.snp.centerX)
        }

        signUpButton.snp.makeConstraints { (make) in
            make.top.equalTo(logInButton.snp.bottom).offset(10)
            make.width.equalTo(logInButton.snp.width)
            make.centerX.equalTo(self.snp.centerX)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
