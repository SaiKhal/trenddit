//
//  ErrorHandlable.swift
//  trenddit
//
//  Created by Masai Young on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol ErrorHandleable {}

extension ErrorHandleable {
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
