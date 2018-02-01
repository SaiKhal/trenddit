//
//  LogInButton.swift
//  trenddit
//
//  Created by Masai Young on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class LogInButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        configureButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButton()
    }
    
    private func configureButton() {
        self.backgroundColor = Stylesheet.Colors.LightGray
        self.layer.borderWidth = 2.0
        self.layer.borderColor = Stylesheet.Colors.DarkGray.cgColor
        self.setTitleColor(Stylesheet.Colors.White, for: .normal)
        self.setTitle("Log In", for: .normal)
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

