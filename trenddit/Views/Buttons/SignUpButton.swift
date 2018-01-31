//
//  SignUpButton.swift
//  trenddit
//
//  Created by Masai Young on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class SignUpButton: UIButton {
    
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
        self.setTitle("Sign Up", for: .normal)
        self.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
    }
    
    @objc func signUpPressed() {
        // Transition to signUpVC
        delegate.signUp()
    }
    
    
}
