//
//  UserClient.swift
//  trenddit
//
//  Created by Masai Young on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseAuth

class UserClient {
    
    func createUser(withEmail: String , password: String) {
        Auth.auth().createUser(withEmail: withEmail, password: password) { (user, error) in
            
        }
    }
    
    
    func signIn(withEmail: String , password: String) {
        Auth.auth().signIn(withEmail: withEmail, password: password) { (user, error) in
            
        }
    }
    
    func signOut() {
        guard Auth.auth().currentUser != nil else { return }
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
    
    func sendPasswordReset(withEmail: String) {
        Auth.auth().sendPasswordReset(withEmail: withEmail) { (error) in
            
        }
    }
    
    func confirmPasswordReset(withCode: String, newPassword: String) {
        Auth.auth().confirmPasswordReset(withCode: withCode, newPassword: newPassword) { (error) in
            
        }
    }
    
    
    //if let user = Auth.auth().currentUser {
    //    User.updatePassword(user)
    //    User.updateEmail(user)
    //    User.sendEmailVerification(user)
    //    User.createProfileChangeRequest(user)
    //}
}

