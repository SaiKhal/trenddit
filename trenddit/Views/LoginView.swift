//
//  LoginView.swift
//  trenddit
//
//  Created by Masai Young on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
import TextFieldEffects

class LoginView: UIView {
    
    let logoView = LogoView()

    // Text Fields
    let emailTextfield = IsaoTextField()
    let passwordTextfield = IsaoTextField()
//    let emailTextfield: EmailTextField = EmailTextField()
//    let passwordTextfield: PasswordTextField = PasswordTextField()
    
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
        setupLogoView()
        setupTextFieldStack()
        setupTextFields()
        setupButtons()
        setupCallToActionStack()
        emailTextfield.activeColor = .orange
        emailTextfield.inactiveColor = Stylesheet.Colors.Blue
        emailTextfield.placeholder = "Enter email"
        emailTextfield.font = UIFont(name: "HelveticaNeue-Light", size: 22)

        
        passwordTextfield.activeColor = .orange
        passwordTextfield.inactiveColor = Stylesheet.Colors.Blue
        passwordTextfield.placeholder = "Enter password"
        passwordTextfield.font = UIFont(name: "HelveticaNeue-Light", size: 22)

    }
    
    // Setup views
    
    private func setupLogoView() {
        self.addSubview(logoView)
        logoView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.centerY)
        }
    }
    
    private func setupTextFieldStack() {
        let stackview = UIStackView(arrangedSubviews: [emailTextfield, passwordTextfield])
        self.addSubview(stackview)
        stackview.alignment = .center
        stackview.axis = .vertical
        stackview.spacing = 0

        stackview.snp.makeConstraints { (make) in
            make.top.equalTo(logoView.snp.bottom).offset(10)
            make.centerX.equalTo(self.snp.centerX)
        }
        
    }

    private func setupTextFields() {
        emailTextfield.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(self.snp.height).multipliedBy(0.1)
        }

        passwordTextfield.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(self.snp.height).multipliedBy(0.1)
        }
    }

    private func setupButtons() {
        self.addSubview(logInButton)
//        self.addSubview(signUpButton)
        logInButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextfield.snp.bottom).offset(30)
            make.width.equalTo(emailTextfield.snp.width)
            make.height.equalTo(emailTextfield.snp.height)
            make.centerX.equalTo(self.snp.centerX)
        }

//        signUpButton.snp.makeConstraints { (make) in
//            make.top.equalTo(logInButton.snp.bottom).offset(10)
//            make.width.equalTo(logInButton.snp.width)
//            make.centerX.equalTo(self.snp.centerX)
//        }
    }
    
    lazy var callToActionLabel: UILabel = {
        let label = UILabel()
        label.text = "DON'T HAVE AN ACCOUNT?"
        return label
    }()
    
    lazy var callToActionButton: UIButton = {
        let bttn = UIButton()
        bttn.backgroundColor = .white
        bttn.setTitle("SIGN UP", for: .normal)
        bttn.setTitleColor(.orange, for: .normal)
        return bttn
    }()
    
    lazy var callToActionStack: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [callToActionLabel, callToActionButton])
        stackview.alignment = .center
        stackview.axis = .horizontal
        stackview.spacing = 5
        return stackview
    }()
    
    func setupCallToActionStack() {
        self.addSubview(callToActionStack)
        callToActionStack.snp.makeConstraints { make in
            make.top.equalTo(logInButton.snp.bottom).offset(30)
            make.centerX.equalTo(self.snp.centerX)
        }
    }

}
