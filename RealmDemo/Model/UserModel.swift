//
//  LoginModel.swift
//  RealmDemo
//
//  Created by Jaskaran softradix on 21/08/24.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var email = ""
    @objc dynamic var password = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
