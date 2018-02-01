//
//  AuthDelegate.swift
//  trenddit
//
//  Created by Masai Young on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseAuth

@objc protocol AuthDelegate {
    @objc optional func signUp()
    @objc optional func logIn()
    @objc optional func didSignIn()
    @objc optional func didCreateUser()
}

extension AuthDelegate {
    func handle(error: Error) {
        let nsError = error as NSError
        if let errorCode = AuthErrorCode(rawValue: nsError.code) {
            switch errorCode {
            case .emailAlreadyInUse:
                print("Email in use already.")
            case .invalidEmail:
                print("Email is invalid.")
            default:
                print("Some error.")
            }
        }
    }
}
