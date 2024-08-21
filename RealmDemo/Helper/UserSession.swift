//
//  UserSession.swift
//  RealmDemo
//
//  Created by Jaskaran softradix on 21/08/24.
//

import Foundation

class UserSession {
    static let shared = UserSession()
    
    private let isLoggedInKey = "isLoggedIn"
    
    private init() { }
    
    func setLoggedIn(_ isLoggedIn: Bool) {
        UserDefaults.standard.set(isLoggedIn, forKey: isLoggedInKey)
    }
    
    func isLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: isLoggedInKey)
    }
    func logOut() {
          UserDefaults.standard.set(false, forKey: "isLoggedIn")
      }
}
