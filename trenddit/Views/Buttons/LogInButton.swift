//
//  LogInButton.swift
//  trenddit
//
//  Created by Masai Young on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class LogInButton: UIButton {
    
    var delegate: AuthDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        configureButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButton()
    }
    
    private func configureButton() {
        self.backgroundColor = Constants.Colors.accent
        self.layer.borderWidth = 2.0
        self.layer.borderColor = Constants.Colors.divider.cgColor
        self.setTitleColor(Constants.Colors.lightPrimary, for: .normal)
        self.setTitle("Log In", for: .normal)
        self.addTarget(self, action: #selector(logInPressed), for: .touchUpInside)
    }
    
    @objc func logInPressed() {
        //Log in after validating text field.
        delegate.logIn()
    }
    
//    @objc func buttonFunc() {
//        guard let emailText = emailTextfield.text, !emailText.isEmpty else {
//            //present no email error
//            let animation = CABasicAnimation(keyPath: "borderColor")
//            animation.fromValue = Constants.Colors.divider.cgColor
//            animation.toValue = Constants.Colors.errorRed.cgColor
//            animation.duration = 2.0
//            let customTimingFunction = CAMediaTimingFunction(controlPoints: 0.0, 0.80, 0.0, 0.98)
//            animation.timingFunction = customTimingFunction
//            self.emailTextfield.layer.add(animation, forKey: animation.keyPath)
//            self.emailTextfield.layer.borderColor = Constants.Colors.divider.cgColor
//            return
//        }
    
    
}

