//
//  CustomTextField.swift
//  trenddit
//
//  Created by Masai Young on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        configureTextField()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureTextField()
    }

    convenience init(placeholderText: String) {
        self.init()
        self.placeholder = placeholderText
    }

    private func configureTextField() {
        self.borderStyle = .line
        self.backgroundColor = Stylesheet.Colors.White
        self.layer.borderWidth = 2.0
        self.isSecureTextEntry = true
    }

}
