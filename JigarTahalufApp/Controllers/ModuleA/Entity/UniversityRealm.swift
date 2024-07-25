//
//  UniversityRealm.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import Foundation
import RealmSwift

/// University Ream model
class UniversityRealmModel: Object {
    
    /// Name
    @objc dynamic var name: String = ""
    
    /// Alpha code
    @objc dynamic var alphaCode: String = ""
    
    /// Web page
    var webPages = List<String>()
    
    /// Country
    @objc dynamic var country: String = ""
    
    /// Domain
    var domains = List<String>()
    
    /// State
    @objc dynamic var state: String?

    /// Primary key
    override static func primaryKey() -> String? {
        return "name"
    }

    /// Init method
    /// - Parameter university: University
    convenience init(university: University) {
        self.init()
        self.alphaCode = university.alphaCode ?? ""
        self.webPages.append(objectsIn: university.webPages ?? [])
        self.country = university.country ?? ""
        self.domains.append(objectsIn: university.domains ?? [])
        self.name = university.name ?? ""
        self.state = university.state
    }
}

extension University {
    /// Init method.
    /// - Parameter relamModel: Realm model of university
    init(realmModel: UniversityRealmModel) {
        self.alphaCode = realmModel.alphaCode
        self.webPages = Array(realmModel.webPages)
        self.country = realmModel.country
        self.domains = Array(realmModel.domains)
        self.name = realmModel.name
        self.state = realmModel.state
    }
}
