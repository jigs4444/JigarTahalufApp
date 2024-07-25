//
//  University.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import Foundation

/// Univeristy Model
struct University: Decodable, Equatable {
    
    /// Name
    let name: String?
    
    /// Country
    let country: String?
    
    /// State
    let state: String?
    
    /// Alpha code
    let alphaCode: String?
    
    /// Web page
    let webPages: [String]?
    
    /// Domain
    let domains: [String]?
 
    enum CodingKeys: String,CodingKey {
        case name, country, domains
        case state = "state-province"
        case alphaCode = "alpha_two_code"
        case webPages = "web_pages"
    }
}
