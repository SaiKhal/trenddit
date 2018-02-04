//
//  SignUpView.swift
//  trenddit
//
//  Created by Masai Young on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
import TextFieldEffects

class SignUpView: UIView {

    let callToActionView = CallToActionView(labelText: "ALREADY HAVE AN ACCOUNT?", buttonText: "Sign In")

    // Text Fields
    let emailTextfield = ViewFactory.TextField.generate(type: .email)
    let passwordTextfield = ViewFactory.TextField.generate(type: .password)
    let usernameTextField = ViewFactory.TextField.generate(type: .general("Enter username"))

    lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.font = UIFont(name: Stylesheet.Fonts.Bold, size: 20)
        return label
    }()

    lazy var profileImageView: UIImageView = {
        let width: CGFloat = UIScreen.main.bounds.width * 0.25
        let iv = UIImageView()
        iv.backgroundColor = .orange
        iv.layer.cornerRadius = 80
        iv.layer.masksToBounds = true
        return iv
    }()

    lazy var dismissButton: UIButton = {
        let bttn = UIButton()
        bttn.setImage(#imageLiteral(resourceName: "close"), for: .normal)
        return bttn
    }()

    // Buttons
    let logInButton: LogInButton = LogInButton()
    let signUpButton: SignUpButton = SignUpButton()

    // Init
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    private func commonInit() {
        self.backgroundColor = Stylesheet.Contexts.Global.BackgroundColor
        setupSignUpLabel()
        setupImageView()
        setupTextFieldStack()
        setupTextFields()
        setupButtons()
        setupDismissButton()
        setupCallToActionStack()
    }

    // Setup views
    private func setupSignUpLabel() {
        self.addSubview(signUpLabel)
        signUpLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.snp.top).offset(50)
        }
    }

    private func setupDismissButton() {
        self.addSubview(dismissButton)
        dismissButton.snp.makeConstraints { make in
            make.size.equalTo(profileImageView).multipliedBy(0.2)
            make.top.equalTo(signUpLabel.snp.top)
            make.right.equalTo(emailTextfield.snp.right)
        }
    }

    private func setupImageView() {
        self.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { (make) in
            make.top.equalTo(signUpLabel.snp.bottom).offset(40)
            make.size.equalTo(160)
            make.centerX.equalTo(self.snp.centerX)
        }
    }

    private func setupTextFieldStack() {
        let stackview = UIStackView(arrangedSubviews: [emailTextfield, passwordTextfield, usernameTextField])
        self.addSubview(stackview)
        stackview.alignment = .center
        stackview.axis = .vertical
        stackview.spacing = 10

        stackview.snp.makeConstraints { (make) in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.centerX.equalTo(self.snp.centerX)
        }

    }

    private func setupTextFields() {
        emailTextfield.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(self.snp.height).multipliedBy(0.1)
        }

        passwordTextfield.snp.makeConstraints { (make) in
            make.width.equalTo(emailTextfield.snp.width)
            make.height.equalTo(emailTextfield.snp.height)
        }

        usernameTextField.snp.makeConstraints { make in
            make.width.equalTo(emailTextfield.snp.width)
            make.height.equalTo(emailTextfield.snp.height)
        }

    }

    private func setupButtons() {
        self.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { (make) in
            make.top.equalTo(usernameTextField.snp.bottom).offset(30)
            make.width.equalTo(emailTextfield.snp.width)
            make.height.equalTo(emailTextfield.snp.height)
            make.centerX.equalTo(self.snp.centerX)
        }
    }

    func setupCallToActionStack() {
        self.addSubview(callToActionView.callToActionStack)
        callToActionView.callToActionStack.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(30)
            make.centerX.equalTo(self.snp.centerX)
        }
    }

}
