//
//  LoginVM.swift
//  RealmDemo
//
//  Created by Jaskaran softradix on 21/08/24.
//

import Foundation
import RealmSwift

class LoginVM :NSObject {
    func login(email: String, password: String) -> Result<User, Error> {
        let realm = try! Realm()
        
        // Fetch user by email
        if let user = realm.objects(User.self).filter("email == %@ AND password == %@", email, password).first {
            return .success(user)
        } else {
            return .failure(NSError(domain: "Invalid credentials", code: 0, userInfo: nil))
        }
    }

}
