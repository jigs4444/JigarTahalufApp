//
//  UniversityListInteractorOutputProtocol.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import Foundation

/// University List Interactor output protocol.
protocol UniversityListInteractorOutputProtocol: AnyObject {
    
    /// Did get universities data from API.
    /// - Parameter universities: Universities array.
    func didGetUniversitiesData(_ universities: [University])
    
    /// Did fail to get data from API.
    /// - Parameter error: Error.
    func didFailToGetUniversitiesData(error: String)
}
