//
//  UniversityListPresenterProtocol.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import Foundation

/// University List Presenter Protocol
protocol UniversityListPresenterProtocol: AnyObject {
    
    /// Load University data from API with Country
    /// - Parameter country: Country name.
    func didLoad(country: String)
    
    /// Select University from cell.
    /// - Parameter university: University.
    func didSelectUniversity(_ university: University)
}
