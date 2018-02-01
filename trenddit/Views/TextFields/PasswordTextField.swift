//
//  PasswordTextField.swift
//  trenddit
//
//  Created by Masai Young on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class PasswordTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        configureTextField()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureTextField()
    }

    private func configureTextField() {
        self.borderStyle = .line
        self.backgroundColor = Stylesheet.Colors.White
        self.layer.borderWidth = 2.0
        self.placeholder = "Enter password"
        self.isSecureTextEntry = true
    }

}
