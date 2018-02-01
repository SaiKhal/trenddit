//
//  SignUpButton.swift
//  trenddit
//
//  Created by Masai Young on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class SignUpButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        configureButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButton()
    }
    
    private func configureButton() {
        self.backgroundColor = Stylesheet.Colors.LightBlue
        self.layer.borderWidth = 2.0
        self.layer.borderColor = Stylesheet.Colors.DarkGray.cgColor
        self.setTitleColor(Stylesheet.Colors.White, for: .normal)
        self.setTitle("Sign Up", for: .normal)
    }
    
}
