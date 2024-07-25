//
//  UniversityListService.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import Foundation

/// University List Service
final class UniversityListService: UniversityListServiceProtocol {
    
    //MARK: Protocol implementation.
    
    func getUniversitiesList(country: String, completion: @escaping (Result<[University], TahalufNetworkError>) -> Void) {
        let urlString = "\(AppConstants.baseURL)/search?country=\(country.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
        NetworkManager.shared.request(urlString: urlString, completion: completion)
    }
}
