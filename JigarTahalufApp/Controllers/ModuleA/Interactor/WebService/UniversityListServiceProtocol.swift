//
//  UniversityListServiceProtocol.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import Foundation

/// University List Service Protocol.
protocol UniversityListServiceProtocol {
    
    /// Get universities list from APi
    /// - Parameter country: Country
    /// - Parameter completion: Completion with university array and Custom network error.
    func getUniversitiesList(country: String,
                           completion: @escaping (Result<[University], TahalufNetworkError>) -> Void)
}
