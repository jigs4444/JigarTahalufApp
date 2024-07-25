//
//  NetworkManager.swift
//  JigarTahalufApp
//
//  Created by Jigar Thakkar on 25/07/24.
//

import Foundation

/// Network Error
enum TahalufNetworkError: Error {
    
    /// Invalid API URL
    case invalidAPIURL
    
    /// Request Failed
    case requestFailed
    
    /// Decoding Failed
    case decodingFailed
}

/// Network Manager
class NetworkManager {
    /// Shared Object
    static let shared = NetworkManager()
    
    /// Init method.
    private init() {}
    
    /// Request method
    /// - Parameter urlString: API URL
    /// - Parameter completion: Completion object with Generic Type T and Network Error 
    func request<T: Decodable>(urlString: String, completion: @escaping (Result<T, TahalufNetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidAPIURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(.requestFailed))
                return
            }
            
            guard let data = data else {
                completion(.failure(.requestFailed))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingFailed))
            }
        }
        task.resume()
    }
}
