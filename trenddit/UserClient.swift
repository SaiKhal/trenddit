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
        Auth.auth().createUser(withEmail: <#T##String#>, password: <#T##String#>) { (<#User?#>, <#Error?#>) in
            <#code#>
        }
    }
    
    
    func signIn(withEmail: String , password: String) {
        Auth.auth().signIn(withEmail: <#T##String#>, password: <#T##String#>) { (<#User?#>, <#Error?#>) in
            <#code#>
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
        Auth.auth().sendPasswordReset(withEmail: <#T##String#>) { (<#Error?#>) in
            <#code#>
        }
    }
    
    func confirmPasswordReset(withCode: String, newPassword: String) {
        Auth.auth().confirmPasswordReset(withCode: <#T##String#>, newPassword: <#T##String#>) { (<#Error?#>) in
            <#code#>
        }
    }
    
    
    //if let user = Auth.auth().currentUser {
    //    User.updatePassword(user)
    //    User.updateEmail(user)
    //    User.sendEmailVerification(user)
    //    User.createProfileChangeRequest(user)
    //}
}

