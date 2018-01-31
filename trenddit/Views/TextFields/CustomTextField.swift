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
    
    init(placeholderText: String) {
        super.init(frame: UIScreen.main.bounds)
        self.placeholder = placeholderText
    }
    
    private func configureTextField() {
        self.borderStyle = .line
        self.backgroundColor = Constants.Colors.iconsOrText
        self.layer.borderWidth = 2.0
        self.isSecureTextEntry = true
    }
    
}
