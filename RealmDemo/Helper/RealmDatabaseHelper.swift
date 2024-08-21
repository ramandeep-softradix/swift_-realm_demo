//
//  RealmDatabaseHelper.swift
//  RealmDemo
//
//  Created by Jaskaran softradix on 21/08/24.
//

import Foundation
import RealmSwift
import UIKit

class DatabaseHelper{
    
    static let shared = DatabaseHelper()
    private var realm = try! Realm()
    
    func getDatabasePath() -> URL?{
        return Realm.Configuration.defaultConfiguration.fileURL
    }
    
    func saveContact(contact: Contact){
        try! realm.write({
            realm.add(contact)
        })
    }
    
    func updateContact(oldContact: Contact, newContact: Contact){
        try! realm.write{
            oldContact.firstname = newContact.firstname
            oldContact.lastname = newContact.lastname
        }
    }
    
    func deleteContact(contact: Contact){
        try! realm.write{
            realm.delete(contact)
        }
    }
    
    func getAllContacts() -> [Contact]{
        return Array(realm.objects(Contact.self))
    }
    
}
