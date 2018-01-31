//
//  SignUpView.swift
//  trenddit
//
//  Created by Masai Young on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class SignUpView: UIView {
    
    // Text Fields
    let emailTextfield: EmailTextField = EmailTextField()
    let passwordTextfield: PasswordTextField = PasswordTextField()
    let usernameTextField: CustomTextField = CustomTextField()
    
    lazy var profileImageView: UIImageView = {
        let width: CGFloat = UIScreen.main.bounds.width * 0.25
        let iv = UIImageView()
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 40
        iv.layer.masksToBounds = true
        return iv
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
        self.backgroundColor = Constants.Colors.lightPrimary
        setupTextFieldStack()
        setupTextFields()
        setupImageView()
        setupButtons()
    }
    
    // Setup views
    
    private func setupImageView() {
        self.addSubview(profileImageView)
        profileImageView.snp.makeConstraints { (make) in
            make.bottom.equalTo(emailTextfield.snp.top).offset(-20)
            make.height.width.equalTo(80)
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
        
        usernameTextField.snp.makeConstraints { make in
            make.width.equalTo(self.snp.width).multipliedBy(0.6)
        }
        
        
    }
    
    private func setupButtons() {
        self.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.centerY).offset(10)
            make.width.equalTo(emailTextfield.snp.width).multipliedBy(0.7)
            make.centerX.equalTo(self.snp.centerX)
        }
    }
    
}

