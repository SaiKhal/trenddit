//
//  UserClient.swift
//  trenddit
//
//  Created by Masai Young on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthClient: NSObject {
    
    var delegate: AuthDelegate!
    
    static var signedIn: Bool {
        if let _ = Auth.auth().currentUser {
            return true
        } else {
            return false
        }
    }
    
    func createUser(withEmail: String, password: String, displayName: String?) {
        Auth.auth().createUser(withEmail: withEmail, password: password) { [weak self] (user, error) in
            if let error = error {
                self?.delegate.handle(error: error)
            }
            guard let user = user else { return }
            if let displayName = displayName {
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = displayName
                changeRequest.commitChanges(completion: { error in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    print("Added displayName: \(displayName) to user: \(user.email ?? "No email")")
                })
                self?.delegate.didCreateUser?(user: user)
            } 
        }
    }
    
    func signIn(withEmail: String, password: String) {
        Auth.auth().signIn(withEmail: withEmail, password: password) { [weak self]  (user, error) in
            if let error = error {
                self?.delegate.handle(error: error)
            }
            
            if let user = user {
                self?.delegate.didSignIn?(user: user)
            }
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
