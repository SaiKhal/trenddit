//
//  TextFieldFactory.swift
//  trenddit
//
//  Created by Masai Young on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import TextFieldEffects

enum TextFieldType {
    case email
    case password
    case general(String)
}

class TextFieldFactory {
    static func generate(type: TextFieldType) -> IsaoTextField {
        let tf = IsaoTextField()

        switch type {
        case .email:
            tf.activeColor = .orange
            tf.inactiveColor = Stylesheet.Colors.Blue
            tf.placeholder = "Enter email"
            tf.keyboardType = .emailAddress
            tf.autocapitalizationType = .none
            tf.font = UIFont(name: Stylesheet.Fonts.Light, size: 22)
        case .password:
            tf.activeColor = .orange
            tf.inactiveColor = Stylesheet.Colors.Blue
            tf.placeholder = "Enter password"
            tf.autocapitalizationType = .none
            tf.isSecureTextEntry = true
            tf.font = UIFont(name: Stylesheet.Fonts.Light, size: 22)
        case let .general (placeholder):
            tf.activeColor = .orange
            tf.inactiveColor = Stylesheet.Colors.Blue
            tf.placeholder = placeholder
            tf.font = UIFont(name: Stylesheet.Fonts.Light, size: 22)
        }
        return tf
    }
}
