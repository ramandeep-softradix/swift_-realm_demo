//
//  SignUpVM.swift
//  RealmDemo
//
//  Created by Jaskaran softradix on 21/08/24.
//

import Foundation
import RealmSwift
class SignUpVM :NSObject{
    func signUp(name: String, email: String, password: String) -> Result<User, Error> {
        let realm = try! Realm()
        
        // Check if the email is already registered
        if realm.objects(User.self).filter("email == %@", email).first != nil {
            return .failure(NSError(domain: "Email already registered", code: 0, userInfo: nil))
        }
        
        // Create a new user
        let newUser = User()
        newUser.name = name
        newUser.email = email
        newUser.password = password
        
        do {
            try realm.write {
                realm.add(newUser)
            }
            return .success(newUser)
        } catch {
            return .failure(error)
        }
    }

}
